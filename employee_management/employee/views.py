from django.shortcuts import get_object_or_404
from django.contrib.auth.decorators import login_required
from django.contrib.auth import get_user_model
from .decorators import admin_required
from .forms import UserEditForm,EmployeeProfileForm,TicketForm
from .models import EmployeeProfile,Ticket,DailyActivity,SessionActivity,Notification,CallNote,Call,ClientCallNote
from django.http import HttpResponseForbidden, JsonResponse
from django.db.models import Max
from django.contrib import auth, messages
from django.shortcuts import render, redirect,HttpResponse
from django.db import IntegrityError


def get_logged_in_users():
    active_sessions = Session.objects.filter(expire_date__gte=timezone.now())
    user_ids = []
    for session in active_sessions:
        data = session.get_decoded()
        if '_auth_user_id' in data:
            user_ids.append(data.get('_auth_user_id'))
    return User.objects.filter(id__in=user_ids, employeeprofile__is_active=True)


# Create your views here.
def index(request):
    if request.user.is_authenticated:
        return redirect('/')
    else:
        return redirect('login')

User = get_user_model()

from .signals import logged_in_users


@login_required
def home(request):
    if request.user.is_authenticated:
        # Get the employee profile
        employee_profile = EmployeeProfile.objects.get(user=request.user)

        # List of logged-in users
        logged_in_users_list = list(logged_in_users)

        # Filter to exclude 'closed' and 'resolved' statuses
        status_filter = ['open', 'pending', 'waiting_on_customer', 'initial_response']

        # Handle the filter for skill
        skill_filter = request.GET.get('skill', None)

        # Only fetch unread notifications for the current user
        notifications = Notification.objects.filter(user=request.user,
                                                    is_read=False) if request.user.is_authenticated else []

        # Filter tickets based on skill if selected, otherwise show all tickets
        if skill_filter:
            all_tickets = Ticket.objects.filter(
                assigned_to__in=logged_in_users_list,
                status__in=status_filter,
                group=skill_filter
            ).order_by('-created_at')
        else:
            all_tickets = Ticket.objects.filter(
                assigned_to__in=logged_in_users_list,
                status__in=status_filter
            ).order_by('-created_at')

        # Create a dictionary to store active calls for each user
        active_calls = {
            user.id: user.assigned_tickets.filter(call_in_progress=True).exists()
            for user in logged_in_users_list
        }

        # Group tickets by user with improved call status tracking
        tickets_by_user = {}
        for ticket in all_tickets:
            ticket.created_at_ist = timezone.localtime(ticket.created_at)
            user_id = ticket.assigned_to.id

            if user_id not in tickets_by_user:
                tickets_by_user[user_id] = {
                    'user': ticket.assigned_to,
                    'latest_ticket': ticket,
                    'assigned_by': ticket.assigned_by,
                    'older_tickets': [],
                    'call_in_progress': active_calls.get(user_id, False)  # Get call status from pre-calculated dict
                }
            else:
                tickets_by_user[user_id]['older_tickets'].append(ticket)

        # Convert tickets_by_user to a list of users and their tickets
        tickets_by_user = list(tickets_by_user.values())

        # Get all distinct skills for the dropdown, exclude empty values
        skills = EmployeeProfile.objects.values_list('skill', flat=True).distinct()
        skills = [skill for skill in skills if skill]  # Remove empty or None skills

        # Get all possible ticket statuses for the status dropdown
        ticket_statuses = Ticket._meta.get_field('status').choices

    else:
        tickets_by_user = []
        skills = []
        ticket_statuses = []

    # Add current timestamp for template
    current_time = timezone.now()

    # Render the home template with the ticket data, skills, and statuses
    return render(request, 'home.html', {
        'tickets_by_user': tickets_by_user,
        'employee_profile': employee_profile,
        'skills': skills,
        'ticket_statuses': ticket_statuses,
        'notifications': notifications,
        'current_time': current_time,
    })



def register(request):
    if request.method == 'POST':
        form = EmployeeProfileForm(request.POST)
        if form.is_valid():
            try:
                user = form.save(commit=False)
                user.set_password(form.cleaned_data['password'])
                user.save()
                is_admin = form.cleaned_data['is_admin']
                if is_admin:
                    EmployeeProfile.objects.create(user=user, is_admin=True)
                else:
                    level = form.cleaned_data['level']
                    skill = form.cleaned_data['skill']
                    EmployeeProfile.objects.create(user=user, level=level, skill=skill, is_admin=False)
                messages.success(request, "Registration successful. Please log in.")
                return redirect('login')
            except IntegrityError as e:
                messages.error(request, f"Error: {str(e)}")
        else:
            messages.error(request, "Please correct the errors below.")
    else:
        form = EmployeeProfileForm()
    return render(request, 'register.html', {'form': form})


from django.contrib.auth import authenticate, login as auth_login


def login(request):
    if request.method == 'POST':
        username = request.POST['username']
        password = request.POST['password']
        user = authenticate(username=username, password=password)

        if user is not None:
            auth_login(request, user)
            user_profile, created = EmployeeProfile.objects.get_or_create(user=user)
            user_profile.is_active = True
            user_profile.save()
            return redirect('dashboard')
        else:
            messages.error(request, 'Invalid username or password.')
            return render(request, 'index.html', {
                'form': {'non_field_errors': ['Invalid username or password.']}
            })
    return render(request, 'index.html')

def logout(request):
    if request.user.is_authenticated:
        user_profile = EmployeeProfile.objects.filter(user=request.user).first()
        if user_profile:
            user_profile.is_active = False
            user_profile.save()
        auth.logout(request)
        messages.success(request, "You have successfully logged out.")
    return redirect('login')



@login_required
def view_profile(request, user_id):
    user = get_object_or_404(User, id=user_id)
    employee_profile = EmployeeProfile.objects.get(user=user)
    context = {
        'user': user,
        'employee_profile': employee_profile,
        'is_on_break': employee_profile.is_on_break,
    }
    return render(request, 'view_profile.html', context)

@login_required
def edit_user(request):
    profile = get_object_or_404(EmployeeProfile, user=request.user)
    if request.method == 'POST':
        form = UserEditForm(request.POST, instance=request.user)
        if form.is_valid():
            form.save()
            profile.skill = form.cleaned_data['skill']
            profile.save()
            return redirect('view_profile', user_id=request.user.id)
    else:
        initial_data = {'skill': profile.skill}
        form = UserEditForm(instance=request.user, initial=initial_data)
    return render(request, 'edit_user.html', {'form': form})

@login_required
def employee_list(request):
    employees=EmployeeProfile.objects.all()
    return render(request,'employee_list.html',{'employees':employees})

@admin_required
def important_function_view(request):
    return render(request, 'important_function.html')

@login_required
def promote_to_admin(request, user_id):
    if request.user.employeeprofile.is_admin:
        employee = EmployeeProfile.objects.get(user_id=user_id)
        employee.is_admin = True
        employee.promoted_to_admin = True
        employee.save()
        messages.success(request, 'User has been promoted to admin.')
    return redirect('employee_list')

@login_required
def depromote_admin(request, user_id):
    if request.user.employeeprofile.is_admin:
        employee = EmployeeProfile.objects.get(user_id=user_id)
        if employee.promoted_to_admin:
            employee.is_admin = False
            employee.promoted_to_admin = False
            employee.save()
            messages.success(request, 'User has been demoted from admin.')
        else:
            messages.error(request, 'Cannot demote registered admin.')
    return redirect('employee_list')

@login_required
def employees_by_level(request, level):
    logged_in_users = get_logged_in_users()
    employees = EmployeeProfile.objects.filter(level=level, user__in=logged_in_users, is_on_break=False)
    return render(request, 'employee_by_level&skill.html', {'employees': employees, 'filter_type': f'Level {level}'})

@login_required
def employees_by_skill(request, skill):
    logged_in_users = get_logged_in_users()
    employees = EmployeeProfile.objects.filter(skill=skill, user__in=logged_in_users, is_on_break=False)
    return render(request, 'employee_by_level&skill.html', {'employees': employees, 'filter_type': skill})

from django.utils import timezone
from django.contrib.sessions.models import Session

@login_required
def create_ticket(request):
    if request.method == 'POST':
        form = TicketForm(request.POST)
        if form.is_valid():
            ticket = form.save(commit=False)
            ticket.created_by = request.user
            ticket.assigned_by = request.user
            ticket.assigned_at = timezone.now()
            ticket.save()
            return redirect('/')
    else:
        form = TicketForm()

    active_sessions = Session.objects.filter(expire_date__gte=timezone.now())
    user_ids = [session.get_decoded().get('_auth_user_id') for session in active_sessions]
    logged_in_users = User.objects.filter(id__in=user_ids, is_active=True, employeeprofile__is_on_break=False)
    employees = logged_in_users.values('id', 'username', 'employeeprofile__skill')

    context = {
        'form': form,
        'employees': list(employees),
    }
    return render(request, 'create_ticket.html', context)


@login_required
def user_tickets(request, user_id):
    user = get_object_or_404(User, id=user_id)
    tickets = Ticket.objects.filter(assigned_to=user)
    notifications = Notification.objects.filter(user=request.user, is_read=False)
    return render(request, 'view_tickets.html', {
        'tickets': tickets,
        'user': user,
        'notifications': notifications,
    })

def view_tickets(request, user_id):
    user = get_object_or_404(User, pk=user_id)
    # Get tickets assigned to the user
    tickets = Ticket.objects.filter(assigned_to=user)
    return render(request, 'view_tickets.html', {'user': user, 'tickets': tickets})

@login_required
def edit_ticket(request, ticket_id):
    ticket = get_object_or_404(Ticket, id=ticket_id)
    if request.user.is_superuser or request.user == ticket.created_by:
        if request.method == 'POST':
            form = TicketForm(request.POST, instance=ticket)
            if form.is_valid():
                form.save()
                return redirect('view_tickets',user_id=ticket.assigned_to.id)
        else:
            form = TicketForm(instance=ticket)
        return render(request, 'edit_ticket.html', {'form': form, 'ticket': ticket})
    else:
        return HttpResponseForbidden("You are not allowed to edit this ticket.")

@login_required
def delete_ticket(request, ticket_id):
    ticket = get_object_or_404(Ticket, id=ticket_id)
    if request.user.employeeprofile.is_admin:
        if request.method == 'POST':
            ticket.delete()
            return redirect('view_tickets', user_id=ticket.assigned_to.id)
        return render(request, 'delete_ticket.html', {'ticket': ticket})
    else:
        return HttpResponseForbidden("You are not allowed to delete this ticket.")

@login_required
def close_ticket(request, ticket_id):
    ticket = get_object_or_404(Ticket, id=ticket_id)
    if ticket.assigned_to != request.user:
        return render(request, 'homepage.html', {
            'error': "You are not authorized to close this ticket.",
            'ticket_id': ticket_id,
        })
    if request.method == 'POST':
        ticket.status = 'closed'
        ticket.save()
        return redirect('home')
    return redirect('home')


@login_required
def assign_ticket(request, ticket_id):
    ticket = get_object_or_404(Ticket, id=ticket_id)

    # Check authorization
    if ticket.assigned_to != request.user and not request.user.employeeprofile.is_admin:
        return render(request, 'homepage.html', {
            'error': "You are not authorized to assign this ticket.",
            'ticket_id': ticket_id,
        })

    if request.method == 'POST':
        form = TicketForm(request.POST, instance=ticket)

        if form.is_valid():
            ticket = form.save(commit=False)

            # Get the 'assigned_user' from the POST request
            new_assigned_user_id = request.POST.get('assigned_user')
            new_assigned_user = get_object_or_404(User, id=new_assigned_user_id)

            # Set the assigned_to field manually
            ticket.assigned_to = new_assigned_user
            ticket.assigned_by = request.user
            ticket.assigned_at = timezone.now()

            # Reset time spent if needed
            ticket.reset_individual_time_spent()

            # Update the internal reassignment note in the `Ticket.note` field
            ticket.note = f"Reassigned to {new_assigned_user.username} by {request.user.username}."

            ticket.save()

            # Notify the user about the assignment
            messages.success(request, f"Ticket {ticket.ticket_id} assigned successfully to {new_assigned_user.username}.")

            # Create a notification for the assigned user
            if new_assigned_user_id != request.user.id:
                Notification.objects.create(
                    user=new_assigned_user,
                    message=f"Ticket with ID: {ticket.ticket_id} has been assigned to you."
                )

            return redirect('home')

    else:
        form = TicketForm(instance=ticket)

    # Get all active users excluding the current user
    logged_in_users = User.objects.filter(is_active=True).exclude(id=request.user.id)

    return render(request, 'assign_ticket.html', {
        'ticket': ticket,
        'form': form,
        'logged_in_users': logged_in_users
    })




from django.views.decorators.csrf import csrf_exempt
@csrf_exempt
@login_required
def update_ticket_status(request):
    if request.method == 'POST':
        try:
            data = json.loads(request.body)
            ticket_id = data.get('ticket_id')
            new_status = data.get('new_status')

            # Validate that both ticket_id and new_status are provided
            if not ticket_id or not new_status:
                return JsonResponse({'success': False, 'message': 'Invalid request data'})

            # Fetch the ticket
            ticket = get_object_or_404(Ticket, id=ticket_id)

            # Check if the current user is the owner of the ticket
            if ticket.assigned_to != request.user:
                return JsonResponse({'success': False, 'message': 'You are not authorized to change the status of this ticket'})

            # Update the ticket status
            ticket.status = new_status
            ticket.save()

            # Return success response with updated status
            return JsonResponse({
                'success': True,
                'new_status': new_status,
                'new_status_label': ticket.get_status_display()  # Send the label for display
            })

        except Exception as e:
            return JsonResponse({'success': False, 'message': str(e)})

    return JsonResponse({'success': False, 'message': 'Invalid request method'})

from django.utils import timezone
@login_required
def add_employee(request):
    if not request.user.employeeprofile.is_admin:
        messages.error(request, "You do not have permission to add employees.")
        return redirect('home')
    if request.method == 'POST':
        form = EmployeeProfileForm(request.POST)
        if form.is_valid():
            user = User.objects.create_user(
                username=form.cleaned_data['username'],
                first_name=form.cleaned_data['first_name'],
                last_name=form.cleaned_data['last_name'],
                email=form.cleaned_data['email'],
                password=form.cleaned_data['password']
            )
            employee_profile = EmployeeProfile.objects.create(
                user=user,
                level='1',
                skill=form.cleaned_data['skill'],
                is_admin=form.cleaned_data['is_admin']
            )
            messages.success(request, "Employee added successfully!")
            return redirect('home')
    else:
        form = EmployeeProfileForm()
    return render(request, 'add_employee.html', {'form': form})



# views.py

@login_required
def toggle_break_status(request):
    user_profile = request.user.employeeprofile
    user_profile.is_on_break = not user_profile.is_on_break
    user_profile.save()

    today = timezone.now().date()
    try:
        current_session = SessionActivity.objects.filter(user=request.user, date=today, logout_time=None).latest('login_time')

        if user_profile.is_on_break:
            # Store currently active tickets in session before pausing them
            active_ticket_ids = list(Ticket.objects.filter(
                assigned_to=request.user,
                is_active=True
            ).values_list('id', flat=True))
            request.session['active_tickets_before_break'] = active_ticket_ids

            # Pause active tickets
            active_tickets = Ticket.objects.filter(id__in=active_ticket_ids)
            for ticket in active_tickets:
                ticket.pause_work()
                ticket.save()

            current_session.break_start_time = timezone.now()
            current_session.save()
        else:
            # Only resume tickets that were active before the break
            active_ticket_ids = request.session.get('active_tickets_before_break', [])
            tickets_to_resume = Ticket.objects.filter(
                assigned_to=request.user,
                id__in=active_ticket_ids
            )
            for ticket in tickets_to_resume:
                ticket.resume_work()
                ticket.save()

            # Clear the stored active tickets
            request.session.pop('active_tickets_before_break', None)

            if current_session.break_start_time:
                break_duration = timezone.now() - current_session.break_start_time
                current_session.break_duration += break_duration
                current_session.break_start_time = None
                current_session.save()

    except SessionActivity.DoesNotExist:
        pass

    return JsonResponse({'status': 'success'})  # Return JSON response




@login_required
def user_profile_view(request):
    user_profile = EmployeeProfile.objects.get(user=request.user)
    total_hours = user_profile.total_time.total_seconds() / 3600
    return render(request, 'profile.html', {'total_hours': total_hours})

def sidebar_view(request):
    skills = ['Windows', 'Linux', 'AWS', 'OCI', 'LEVELONE']
    return render(request, 'home_ticket.html', {'skills': skills})


@login_required
def toggle_break(request):
    user_profile = request.user.employeeprofile
    user_profile.is_on_break = not user_profile.is_on_break
    user_profile.save()
    return redirect('view_profile', user_id=request.user.id)



def employee_list_view(request):
    employees = EmployeeProfile.objects.all()
    sessions = Session.objects.filter(expire_date__gte=timezone.now())
    user_ids = []
    for session in sessions:
        data = session.get_decoded()
        user_ids.append(data.get('_auth_user_id', None))
    logged_in_users = get_user_model().objects.filter(id__in=user_ids)
    return render(request, 'employee_list.html', {
        'employees': employees,
        'logged_in_users': logged_in_users,
        'filter_type': 'All Employees'
    })

from django.contrib.auth.models import User

def ticket_overview_view(request):
    users_with_tickets = User.objects.prefetch_related('ticket_set').filter(ticket__isnull=False)
    context = {
        'users_with_tickets': users_with_tickets,
    }
    return render(request, 'homepage.html', context)

def format_duration(duration):
    total_seconds = int(duration.total_seconds())
    hours = total_seconds // 3600
    minutes = (total_seconds % 3600) // 60
    seconds = total_seconds % 60
    return f"{hours} hours, {minutes} minutes, {seconds} seconds"

@login_required
def daily_activity_view(request):
    selected_date = request.GET.get('date', None)
    if selected_date:
        selected_date = timezone.datetime.strptime(selected_date, "%Y-%m-%d").date()
    else:
        selected_date = timezone.now().date()

    # Get today's activities (one per user)
    activities = DailyActivity.objects.filter(date=selected_date).order_by('login_time')

    # Format total work time for each activity
    for activity in activities:
        activity.total_work_time_str = format_duration(activity.calculate_total_work_time())
        activity.total_break_time = format_duration(activity.calculate_total_break_time())

    return render(request, 'daily_activity.html', {'activities': activities,'selected_date': selected_date})




@login_required
def user_activity_view(request, user_id):
    user = get_object_or_404(User, id=user_id)

    # Get the selected date from the request (if none, default to today)
    selected_date = request.GET.get('date', None)
    if selected_date:
        selected_date = timezone.datetime.strptime(selected_date, "%Y-%m-%d").date()
    else:
        selected_date = timezone.now().date()

    # Fetch all sessions for the user on the selected date from SessionActivity
    activities = SessionActivity.objects.filter(user=user, date=selected_date).order_by('login_time')

    # Format the work time and break duration for each session
    for activity in activities:
        activity.work_time_str = format_duration(activity.work_time)
        activity.break_duration_str = format_duration(activity.break_duration)

    return render(request, 'user_activity.html', {
        'user': user,
        'activities': activities,
        'selected_date': selected_date
    })


@login_required
def start_work(request, ticket_id):
    ticket = get_object_or_404(Ticket, id=ticket_id)

    if request.method == 'POST':
        ticket.start_work()

        # Get total and individual time in seconds
        total_time_spent_seconds = int(ticket.time_spent.total_seconds()) if ticket.time_spent else 0
        individual_time_spent_seconds = int(ticket.individual_time_spent.total_seconds()) if ticket.individual_time_spent else 0

        return JsonResponse({
            'status': 'success',
            'time_spent_seconds': total_time_spent_seconds,
            'individual_time_spent_seconds': individual_time_spent_seconds
        })



@login_required
def stop_work(request, ticket_id):
    ticket = get_object_or_404(Ticket, id=ticket_id)

    if request.method == 'POST':
        ticket.pause_work()

        # Get total and individual time in seconds
        total_time_spent_seconds = int(ticket.time_spent.total_seconds()) if ticket.time_spent else 0
        individual_time_spent_seconds = int(ticket.individual_time_spent.total_seconds()) if ticket.individual_time_spent else 0

        return JsonResponse({
            'status': 'success',
            'time_spent_seconds': total_time_spent_seconds,
            'individual_time_spent_seconds': individual_time_spent_seconds
        })




from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
from datetime import timedelta
import json

@csrf_exempt
def update_time_spent(request):
    if request.method == 'POST':
        try:
            data = json.loads(request.body)
            ticket_id = data.get('ticket_id')
            time_spent_seconds = data.get('time_spent')

            # Convert time_spent from seconds to timedelta
            time_spent = timedelta(seconds=time_spent_seconds)

            # Find the ticket
            ticket = Ticket.objects.get(id=ticket_id)

            # Add the time spent to the ticket's existing time_spent (which is also a timedelta)
            if ticket.time_spent is None:  # Handle if time_spent was initially null
                ticket.time_spent = time_spent
            else:
                ticket.time_spent += time_spent

            # Save the ticket with the updated time_spent
            ticket.save()

            return JsonResponse({'status': 'success', 'time_spent': str(ticket.time_spent)})

        except Ticket.DoesNotExist:
            return JsonResponse({'status': 'error', 'message': 'Ticket not found'}, status=404)
        except Exception as e:
            return JsonResponse({'status': 'error', 'message': str(e)}, status=500)

    return JsonResponse({'status': 'error', 'message': 'Invalid request'}, status=400)


@csrf_exempt
def update_ticket_activity(request):
    if request.method == 'POST':
        data = json.loads(request.body)
        ticket_id = data.get('ticket_id')
        action = data.get('action')  # 'start' or 'stop'

        try:
            ticket = Ticket.objects.get(id=ticket_id)

            if action == 'start':
                print(f'Starting timer for ticket {ticket_id}')  # Debug
                ticket.is_active = True
                ticket.work_start_time = timezone.now()
            elif action == 'stop':
                print(f'Stopping timer for ticket {ticket_id}')  # Debug
                ticket.is_active = False
                ticket.pause_work()  # Pause the work and calculate the time spent

            ticket.save()
            return JsonResponse({'status': 'success'})
        except Ticket.DoesNotExist:
            print(f'Ticket {ticket_id} not found.')  # Debug
            return JsonResponse({'status': 'error', 'message': 'Ticket not found'})

    return JsonResponse({'status': 'error', 'message': 'Invalid request'})



@login_required
def toggle_timer(request):
    user_profile = EmployeeProfile.objects.get(user=request.user)
    if user_profile.is_active:
        user_profile.is_active = False  # Stop timer
    else:
        user_profile.is_active = True  # Start timer
    user_profile.save()
    return (redirect('home'))

@login_required
def clear_notification(request):
    if 'ticket_notification' in request.session:
        del request.session['ticket_notification']
    return JsonResponse({'status': 'success'})


@login_required
def filter_users_by_group(request):
    group = request.GET.get('group')

    if group:
        # Fetch logged-in users with the selected skill
        active_sessions = Session.objects.filter(expire_date__gte=timezone.now())
        user_ids = [session.get_decoded().get('_auth_user_id') for session in active_sessions]
        logged_in_users = User.objects.filter(id__in=user_ids, is_active=True, employeeprofile__skill=group)

        # Prepare the data to return as JSON
        users_data = [{'id': user.id, 'username': user.username} for user in logged_in_users]
        return JsonResponse({'users': users_data})

    return JsonResponse({'users': []})

@login_required
def mark_notification_as_read(request):
    notification_id = request.GET.get('id')
    notification = get_object_or_404(Notification, id=notification_id, user=request.user)
    notification.is_read = True
    notification.save()
    return JsonResponse({'status': 'success'})

from django.db import models  # <-- Add this import
@login_required
def dashboard(request):
    user = request.user

    # Get the employee profile for the logged-in user
    try:
        employee_profile = EmployeeProfile.objects.get(user=user)
    except EmployeeProfile.DoesNotExist:
        employee_profile = None

    # Total number of tickets for the user
    total_tickets = Ticket.objects.filter(assigned_to=user).count()

    # Count of tickets by status
    ticket_status_counts = Ticket.objects.filter(assigned_to=user).values('status').annotate(count=models.Count('status'))

    # Total time spent on tickets (sum of all time_spent)
    total_time_spent = Ticket.objects.filter(assigned_to=user).aggregate(total_time=models.Sum('time_spent'))['total_time']
    total_time_spent_hours = total_time_spent.total_seconds() / 3600 if total_time_spent else 0

    # Fetch all tickets assigned to the user
    tickets = Ticket.objects.filter(assigned_to=user).order_by('-created_at')

    ticket_statuses = Ticket._meta.get_field('status').choices

    context = {
        'employee_profile': employee_profile,
        'total_tickets': total_tickets,
        'ticket_status_counts': ticket_status_counts,
        'total_time_spent': total_time_spent_hours,
        'tickets': tickets,
        'ticket_statuses':ticket_statuses,
    }

    return render(request, 'dashboard.html', context)


@login_required
def start_end_call(request, ticket_id):
    ticket = get_object_or_404(Ticket, id=ticket_id)
    agent = request.user

    if request.method == "POST":
        action = request.POST.get('action')

        # Start call
        if action == "start_call" and not ticket.call_in_progress:
            timer_started_by_call = ticket.start_call()
            new_call = Call.objects.create(
                ticket=ticket,
                agent=agent,
                call_start_time=timezone.now()
            )

            return JsonResponse({
                'status': 'success',
                'message': 'Call started successfully',
                'current_status': ticket.status,
                'timer_started_by_call': timer_started_by_call
            })

        # End call
        elif action == "end_call" and ticket.call_in_progress:
            current_call = Call.objects.filter(ticket=ticket, agent=agent).order_by('-call_start_time').first()
            if current_call:
                return JsonResponse({
                    'status': 'success',
                    'ticket_id': ticket.id,
                    'ticket_display_id': ticket.ticket_id,
                    'subject': ticket.subject,
                    'call_duration': str(current_call.call_duration),
                    'current_status': ticket.status,
                })
            else:
                return JsonResponse({
                    'status': 'error',
                    'message': 'No active call found'
                }, status=400)
        else:
            return JsonResponse({
                'status': 'error',
                'message': 'Invalid action or call state'
            }, status=400)

    # If not a POST request
    return JsonResponse({
        'status': 'error',
        'message': 'Invalid request method'
    }, status=405)


@login_required
def post_call_details(request, ticket_id):
    ticket = get_object_or_404(Ticket, id=ticket_id)

    if request.method == "POST":
        current_call = Call.objects.filter(ticket=ticket, agent=request.user).order_by('-call_start_time').first()

        if current_call:
            # Save call details
            current_call.call_end_time = timezone.now()
            current_call.call_note = request.POST.get('note')
            current_call.save()

            # Update ticket status if provided
            if status := request.POST.get('status'):
                ticket.status = status

            # Check if timer should be stopped
            should_stop_timer = ticket.call_timer_started_by_call

            # End the call (this will also stop timer if needed)
            ticket.end_call()

            return JsonResponse({
                'status': 'success',
                'message': 'Post-call details saved successfully',
                'timer_stopped': should_stop_timer
            })

    return JsonResponse({'status': 'error', 'message': 'Invalid request'}, status=400)

@login_required
def view_call_details(request, ticket_id):
    ticket = get_object_or_404(Ticket, id=ticket_id)

    # Get all calls related to this ticket
    calls = Call.objects.filter(ticket=ticket).order_by('call_start_time')

    return render(request, 'view_call_details.html', {'ticket': ticket, 'calls': calls})


@login_required
def save_call_note(request):
    if request.method == 'POST':
        email = request.POST.get('email')
        note = request.POST.get('note')

        # Save the note to the database or send an email
        # Example: You can save it in a model for call notes
        call_note = CallNote.objects.create(agent=request.user, client_email=email, note=note)
        call_note.save()

        # Return a success response
        return JsonResponse({'status': 'success', 'message': 'Note saved successfully!'})

    return JsonResponse({'status': 'error', 'message': 'Invalid request.'}, status=400)


@login_required
def update_all_timers(request):
    # Get all active tickets
    active_tickets = Ticket.objects.filter(is_active=True)

    timers = []
    for ticket in active_tickets:
        # Calculate time spent in seconds for each active ticket
        if ticket.work_start_time:
            time_diff = timezone.now() - ticket.work_start_time
            total_time = ticket.time_spent + time_diff
            total_seconds = int(total_time.total_seconds())
        else:
            total_seconds = int(ticket.time_spent.total_seconds())

        timers.append({
            'ticket_id': ticket.id,
            'time_spent_seconds': total_seconds
        })

    return JsonResponse({'timers': timers})

@login_required
def ticket_status(request, ticket_id):
    try:
        ticket = Ticket.objects.get(id=ticket_id)
        time_spent_seconds = ticket.time_spent.total_seconds() if ticket.time_spent else 0

        # If the ticket is active (timer running)
        if ticket.is_active and ticket.work_start_time:
            # Calculate additional time once (difference between now and work_start_time)
            time_difference = (timezone.now() - ticket.work_start_time).total_seconds()

            # Add that time difference ONCE to the accumulated time
            time_spent_seconds += time_difference
        else:
            # Ticket is paused, don't add any additional time
            time_difference = None

        return JsonResponse({
            'status': 'success',
            'time_spent_seconds': time_spent_seconds,  # Correctly calculated time
            'work_start_time': ticket.work_start_time.isoformat() if ticket.work_start_time else None
        })

    except Ticket.DoesNotExist:
        return JsonResponse({'status': 'error', 'message': 'Ticket not found'}, status=404)


@login_required
def get_active_timers(request):
    """Fetch active timers with real-time time spent (both total and individual)."""
    active_tickets = Ticket.objects.filter(is_active=True)

    # Serialize the active ticket data
    ticket_data = []
    for ticket in active_tickets:
        # Calculate total time spent
        total_time_spent_seconds = ticket.time_spent.total_seconds() if ticket.time_spent else 0
        # Calculate individual time spent
        individual_time_spent_seconds = ticket.individual_time_spent.total_seconds() if ticket.individual_time_spent else 0

        if ticket.work_start_time:
            # Calculate the time since the timer started for both total and individual times
            elapsed_time = (timezone.now() - ticket.work_start_time).total_seconds()
            total_time_spent_seconds += elapsed_time
            individual_time_spent_seconds += elapsed_time

        # Append both total and individual time spent to the response
        ticket_data.append({
            'ticket_id': ticket.id,
            'time_spent_seconds': int(total_time_spent_seconds),  # Total time spent
            'individual_time_spent_seconds': int(individual_time_spent_seconds),  # Individual time spent
            'is_active': ticket.is_active
        })

    return JsonResponse({'tickets': ticket_data})


@login_required
def get_call_status(request):
    users_with_calls = User.objects.filter(assigned_tickets__call_in_progress=True).distinct()
    call_statuses = [{
        'user_id': user.id,
        'call_in_progress': True
    } for user in users_with_calls]

    return JsonResponse(call_statuses, safe=False)


# Search ticket by ID
def search_ticket(request, ticket_id):
    if request.method == "GET":
        try:
            # Fetch the ticket by ticket_id
            ticket = Ticket.objects.get(ticket_id=ticket_id)
            users = User.objects.all()  # Fetch all users for the assigned-to dropdown

            # Prepare ticket data including the note field
            ticket_data = {
                "subject": ticket.subject,
                "assigned_to": ticket.assigned_to.id if ticket.assigned_to else None,
                "priority": ticket.priority,
                "note": ticket.note  # Ensure the note is included in the response
            }

            # Prepare users data for the dropdown
            users_data = [{"id": user.id, "username": user.username} for user in users]

            return JsonResponse({"success": True, "ticket": ticket_data, "users": users_data})

        except Ticket.DoesNotExist:
            return JsonResponse({"success": False, "message": "Ticket not found"})

    return JsonResponse({"success": False, "message": "Invalid request method"})


@login_required
def update_ticket(request, ticket_id):
    if request.method == "POST":
        ticket = get_object_or_404(Ticket, ticket_id=ticket_id)

        # Get data from the form submission
        subject = request.POST.get("subject")
        assigned_to_id = request.POST.get("assigned_to")
        priority = request.POST.get("priority")
        client_call_note = request.POST.get("client_call_note")

        # Update the ticket fields
        ticket.subject = subject
        ticket.priority = priority

        if assigned_to_id:
            assigned_user = get_object_or_404(User, id=assigned_to_id)
            ticket.assigned_to = assigned_user

        # Create a new ClientCallNote instead of updating ticket.client_call_note
        if client_call_note:  # Only create if there's a note
            ClientCallNote.objects.create(
                ticket=ticket,
                note_text=client_call_note,
                created_by=request.user
            )

        ticket.save()

        return JsonResponse({"success": True, "message": "Ticket updated successfully"})

    return JsonResponse({"success": False, "message": "Invalid request method"})


@login_required
def view_ticket_notes(request, ticket_id):
    ticket = get_object_or_404(Ticket, id=ticket_id)

    # Fetch all client call notes for this ticket
    client_call_notes = ticket.client_call_notes.all().order_by('-created_at')

    return render(request, 'ticket_notes.html', {
        'ticket': ticket,
        'client_call_notes': client_call_notes
    })
