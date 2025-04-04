import os
from django.conf import settings
from django.shortcuts import get_object_or_404
from django.contrib.auth.decorators import login_required
from django.contrib.auth import get_user_model
from django.urls import reverse
from django.db.models import Q
from .decorators import admin_required
from .forms import UserEditForm,EmployeeProfileForm,TicketForm,OnDutyRequestForm
from .models import EmployeeProfile,Ticket,DailyActivity,SessionActivity,CallNote,Call,ClientCallNote,NewCallQuery,UnifiedNotification,WorkReport,TicketNote,OnDutyRequest,SKILL_CHOICES
from django.http import HttpResponseForbidden, JsonResponse
from django.db.models import Max
from django.contrib import auth, messages
from django.shortcuts import render, redirect,HttpResponse
from django.db import IntegrityError
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
from datetime import timedelta,datetime
import json
from django.utils import timezone
import pytz
from django.db.models import Count, Sum


# Activate the Asia/Kolkata timezone
timezone.activate(pytz.timezone('Asia/Kolkata'))

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
        status_filter = ['open', 'pending', 'waiting_on_customer', 'initial_response' , 'on_hold']

        # Handle the filter for skill
        skill_filter = request.GET.get('skill', None)

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
            user_profile = EmployeeProfile.objects.get(user=ticket.assigned_to)

            if user_id not in tickets_by_user:
                tickets_by_user[user_id] = {
                    'user': ticket.assigned_to,
                    'latest_ticket': ticket,
                    'assigned_by': ticket.assigned_by,
                    'older_tickets': [],
                    'call_in_progress': active_calls.get(user_id, False),  # Get call status from pre-calculated dict
                    'is_idle': user_profile.is_idle
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
        email = request.POST['email']
        password = request.POST['password']
        try:
            user = User.objects.get(email=email)
            user = authenticate(username=user.username, password=password)

            if user is not None:
                auth_login(request, user)
                user_profile, created = EmployeeProfile.objects.get_or_create(user=user)
                user_profile.is_active = True
                user_profile.save()
                return redirect('dashboard')
            else:
                messages.error(request, 'Invalid email or password.')
        except User.DoesNotExist:
            messages.error(request, 'No user found with this email address.')

        return render(request, 'index2.html', {
            'form': {'non_field_errors': ['Invalid email or password.']}
        })
    return render(request, 'index2.html')


def logout(request):
    if request.user.is_authenticated:
        # Check if it's an AJAX request
        is_ajax = request.headers.get('X-Requested-With') == 'XMLHttpRequest'

        # Check for tickets that need attention (open, pending, or initial_response)
        restricted_tickets = Ticket.objects.filter(
            assigned_to=request.user,
            status__in=['open', 'pending', 'initial_response']
        ).values('ticket_id', 'subject', 'status')

        if restricted_tickets.exists():
            # Group tickets by status for better display
            tickets_by_status = {}
            for ticket in restricted_tickets:
                status = ticket['status'].replace('_', ' ').title()
                if status not in tickets_by_status:
                    tickets_by_status[status] = []
                tickets_by_status[status].append(ticket)

            return JsonResponse({
                'status': 'error',
                'message': 'Cannot logout with unresolved tickets',
                'tickets': tickets_by_status
            })

        # If no restricted tickets, proceed with logout
        user_profile = EmployeeProfile.objects.filter(user=request.user).first()
        if user_profile:
            user_profile.is_active = False
            user_profile.save()
        auth.logout(request)

        # Return appropriate response based on request type
        if is_ajax:
            return JsonResponse({
                'status': 'success',
                'message': 'Successfully logged out'
            })
        return redirect('login')

    # If user is not authenticated
    if request.headers.get('X-Requested-With') == 'XMLHttpRequest':
        return JsonResponse({
            'status': 'success',
            'message': 'User not authenticated'
        })
    return redirect('login')


@login_required
def view_profile(request, user_id):
    user = get_object_or_404(User, id=user_id)
    employee_profile = EmployeeProfile.objects.get(user=user)

    if request.method == 'POST':
        if 'profile_picture' in request.FILES:
            try:
                employee_profile.profile_picture = request.FILES['profile_picture']
                employee_profile.full_clean()
                employee_profile.save()
                messages.success(request, 'Profile picture updated successfully!')
            except ValidationError as e:
                messages.error(request, e.messages[0])
        elif request.POST.get('remove_picture') == 'true':
            if employee_profile.profile_picture:
                employee_profile.profile_picture.delete()
                employee_profile.profile_picture = None
                employee_profile.save()
                messages.success(request, 'Profile picture removed successfully!')
        return redirect('view_profile', user_id=user_id)

    # Calculate total stats
    total_tickets = Ticket.objects.filter(assigned_to=user).count()
    resolved_tickets = Ticket.objects.filter(
        assigned_to=user,
        status__in=['resolved', 'closed']
    ).count()

    # Calculate total work time from both DailyActivity and SessionActivity
    daily_activities = DailyActivity.objects.filter(user=user).aggregate(
        total=Sum('total_work_time')
    )['total'] or timedelta()

    session_activities = SessionActivity.objects.filter(user=user).aggregate(
        total=Sum('work_time')
    )['total'] or timedelta()

    # Combine both totals
    total_work_time = daily_activities + session_activities

    # Convert to hours with 1 decimal place
    total_hours = round(total_work_time.total_seconds() / 3600, 1)

    if request.method == 'POST' and request.FILES.get('profile_picture'):
        try:
            employee_profile.profile_picture = request.FILES['profile_picture']
            employee_profile.full_clean()
            employee_profile.save()
        except ValidationError as e:
            messages.error(request, e.messages[0])
        return redirect('view_profile', user_id=user_id)

    context = {
        'user': user,
        'profile': employee_profile,
        'total_tickets': total_tickets,
        'resolved_tickets': resolved_tickets,
        'total_time': total_hours,
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
    employees=EmployeeProfile.objects.filter(~Q(user__is_superuser=True))
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
from django.template.loader import render_to_string
from django.http import JsonResponse


@login_required
def create_ticket(request):
    if request.method == 'POST':
        form = TicketForm(request.POST)
        if form.is_valid():
            ticket = form.save(commit=False)
            ticket.created_by = request.user
            ticket.assigned_by = request.user
            current_time = timezone.localtime()
            ticket.created_at = current_time
            ticket.assigned_at = current_time
            ticket.save()

            if form.cleaned_data.get('note'):
                TicketNote.objects.create(
                    ticket=ticket,
                    note_type='creation',
                    note_text=form.cleaned_data['note'],
                    created_by=request.user
                )

            if ticket.assigned_to and ticket.assigned_to != request.user:
                UnifiedNotification.objects.create(
                    ticket=ticket,
                    user=ticket.assigned_to,
                    notification_type='created',
                    message=f'New ticket #{ticket.ticket_id} has been created and assigned to you by {request.user.username}',
                    last_notification_time=current_time
                )

            if request.headers.get('X-Requested-With') == 'XMLHttpRequest':
                return JsonResponse({'success': True})
            return redirect('dashboard')
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

    if request.headers.get('X-Requested-With') == 'XMLHttpRequest':
        html = render_to_string('create_ticket_form.html', context, request=request)
        return JsonResponse({
            'html': html,
            'employees': list(employees)
        })

    return render(request, 'create_ticket.html', context)


@login_required
def user_tickets(request, user_id):
    user = get_object_or_404(User, id=user_id)
    tickets = Ticket.objects.filter(assigned_to=user)
    notifications = UnifiedNotification.objects.filter(user=request.user, is_read=False)
    # Convert created_at times to local timezone
    for ticket in tickets:
        ticket.created_at = timezone.localtime(ticket.created_at)
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

    if request.method == 'POST':
        form = TicketForm(request.POST, instance=ticket, is_assign=True)

        if form.is_valid():
            ticket = form.save(commit=False)

            new_assigned_user_id = request.POST.get('assigned_user')
            new_assigned_user = get_object_or_404(User, id=new_assigned_user_id)
            old_assigned_user = ticket.assigned_to
            if old_assigned_user != new_assigned_user:
                ticket.individual_time_spent = timezone.timedelta(0)
            if form.cleaned_data.get('note'):
                TicketNote.objects.create(
                    ticket=ticket,
                    note_type='reassignment',
                    note_text=form.cleaned_data['note'],
                    created_by=request.user
                )

            # Reset acknowledgment
            ticket.reset_acknowledgment()

            # Update ticket
            ticket.assigned_to = new_assigned_user
            ticket.assigned_by = request.user
            ticket.assigned_at = timezone.now()
            ticket.save()

            # Create notification for the newly assigned user
            if str(new_assigned_user.id) != str(request.user.id):
                UnifiedNotification.objects.create(
                    ticket=ticket,
                    user=new_assigned_user,
                    notification_type='assigned',
                    message=f"Ticket #{ticket.ticket_id} has been reassigned to you by {request.user.username}",
                    last_notification_time=timezone.now()
                )

            # Optional: Notify the previously assigned user
            if old_assigned_user and old_assigned_user != new_assigned_user:
                UnifiedNotification.objects.create(
                    ticket=ticket,
                    user=old_assigned_user,
                    notification_type='assigned',
                    message=f"Ticket #{ticket.ticket_id} has been reassigned from you to {new_assigned_user.username}",
                    last_notification_time=timezone.now()
                )

            return redirect('dashboard')

    else:
        form = TicketForm(instance=ticket, is_assign=True)

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

            if not ticket_id or not new_status:
                return JsonResponse({'success': False, 'message': 'Invalid request data'})

            ticket = get_object_or_404(Ticket, id=ticket_id)

            if ticket.assigned_to != request.user:
                return JsonResponse({'success': False, 'message': 'You are not authorized to change the status of this ticket'})

            # Check if ticket has active call or timer
            has_active_call = ticket.call_in_progress
            is_timer_active = ticket.is_active

            # Update the ticket status
            ticket.status = new_status
            ticket.status_changed = timezone.now()

            # If status is closed/resolved, end call and stop timer
            if new_status in ['closed', 'resolved']:
                if has_active_call:
                    # End the active call
                    current_call = Call.objects.filter(
                        ticket=ticket,
                        agent=request.user,
                        call_end_time__isnull=True
                    ).first()
                    if current_call:
                        current_call.call_end_time = timezone.now()
                        current_call.save()
                    ticket.end_call()

                if is_timer_active:
                    ticket.pause_work()

            ticket.save()

            return JsonResponse({
                'success': True,
                'new_status': new_status,
                'new_status_label': ticket.get_status_display(),
                'status_changed': ticket.status_changed.isoformat(),
                'timer_stopped': is_timer_active,
                'call_ended': has_active_call
            })

        except Exception as e:
            return JsonResponse({'success': False, 'message': str(e)})

    return JsonResponse({'success': False, 'message': 'Invalid request method'})


@login_required
def add_employee(request):
    if not request.user.employeeprofile.is_admin:
        messages.error(request, "You do not have permission to add employees.")
        return redirect('home')

    if request.method == 'POST':
        form = EmployeeProfileForm(request.POST)
        if form.is_valid():
            email = form.cleaned_data['email']

            # Check if email already exists
            if User.objects.filter(email=email).exists():
                messages.error(request, "This email is already registered.")
                return render(request, 'add_employee.html', {'form': form})

            # Create user with email as username
            user = User.objects.create_user(
                username=email,
                email=email,
                first_name=form.cleaned_data['first_name'],
                last_name=form.cleaned_data['last_name'],
                password=form.cleaned_data['password']
            )

            # Create employee profile
            employee_profile = EmployeeProfile.objects.create(
                user=user,
                level=form.cleaned_data['level'],
                skill=form.cleaned_data['skill'],
                is_admin=form.cleaned_data['is_admin'],
                reporting_manager=form.cleaned_data['reporting_manager']
            )
            return redirect('employee_list')
    else:
        form = EmployeeProfileForm()

    # Get all employees grouped by skill for the reporting manager dropdown
    employees_by_skill = {
        skill[0]: EmployeeProfile.objects.filter(skill=skill[0]).select_related('user')
        for skill in SKILL_CHOICES
    }

    return render(request, 'add_employee.html', {
        'form': form,
        'employees_by_skill': employees_by_skill
    })



@login_required
def toggle_break_status(request):
    user_profile = request.user.employeeprofile

    # If user is trying to go on break
    if not user_profile.is_on_break:
        can_break, message = EmployeeProfile.can_take_break(user_profile.skill)
        if not can_break:
            return JsonResponse({
                'status': 'error',
                'message': message
            })

    # If we get here, either user is returning from break or can take a break
    user_profile.is_on_break = not user_profile.is_on_break
    user_profile.save()

    today = timezone.now().date()
    try:
        current_session = SessionActivity.objects.filter(
            user=request.user,
            date=today,
            logout_time=None
        ).latest('login_time')

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

    # Check if others can now take breaks
    if not user_profile.is_on_break:  # User just returned from break
        available_breaks = EmployeeProfile.get_active_users_in_skill(user_profile.skill) // 2 - \
                           EmployeeProfile.get_users_on_break_in_skill(user_profile.skill)
        if available_breaks > 0:
            message = f"✨ Break slot now available! Team members can take a break. {available_breaks} break slot(s) open. 🎉"
        else:
            message = None
    else:
        message = None

    return JsonResponse({
        'status': 'success',
        'message': message
    })




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

    # Get today's activities
    activities = DailyActivity.objects.filter(date=selected_date).order_by('login_time')

    # Format durations for each activity
    for activity in activities:
        activity.total_work_time_str = format_duration(activity.calculate_total_work_time())
        activity.total_break_time = format_duration(activity.calculate_total_break_time())

        # Get idle time directly from UserActivity
        idle_time = activity.calculate_total_idle_time()
        activity.total_idle_time = format_duration(idle_time)

    return render(request, 'daily_activity.html', {
        'activities': activities,
        'selected_date': selected_date
    })


def format_duration(duration):
    total_seconds = int(duration.total_seconds())
    hours = total_seconds // 3600
    minutes = (total_seconds % 3600) // 60
    seconds = total_seconds % 60
    return f"{hours} hours, {minutes} minutes, {seconds} seconds"




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

from django.db import models  # <-- Add this import
from datetime import datetime, time, timedelta
from django.utils import timezone
@login_required
def dashboard(request):
    user = request.user
    now = timezone.localtime(timezone.now())
    local_today_start = timezone.make_aware(datetime.combine(now.date(), time.min))
    local_today_end = timezone.make_aware(datetime.combine(now.date(), time.max))

    try:
        employee_profile = EmployeeProfile.objects.get(user=user)
    except EmployeeProfile.DoesNotExist:
        employee_profile = None

    # 1. Today's Tickets
    todays_tickets = Ticket.objects.filter(
        assigned_to=user,
        assigned_at__range=(local_today_start, local_today_end)
    ).count()

    # 2. Open Tickets
    open_tickets = Ticket.objects.filter(
        assigned_to=user,
        assigned_at__range=(local_today_start, local_today_end),
        status='open',
        status_changed__isnull=True  # This means the status hasn't been changed
    ).count()

    # 3. Closed Tickets
    closed_tickets = Ticket.objects.filter(
        assigned_to=user,
        status_changed__range=(local_today_start, local_today_end),
        status__in=['closed', 'resolved']
    ).count()

    # 4. Total Call Time (from Call model and NewCallQuery)
    total_duration = timedelta(0)

    # Get duration from Call model
    calls = Call.objects.filter(
        agent=user,
        call_start_time__range=(local_today_start, local_today_end),
        call_end_time__isnull=False
    )
    for call in calls:
        if call.call_end_time and call.call_start_time:
            duration = call.call_end_time - call.call_start_time
            total_duration += duration

    # Get duration from NewCallQuery model
    new_calls = NewCallQuery.objects.filter(
        agent=user,
        call_start_time__range=(local_today_start, local_today_end),
        call_duration_seconds__isnull=False
    )
    for call in new_calls:
        total_duration += timedelta(seconds=call.call_duration_seconds or 0)

    # Format the duration for display
    total_seconds = int(total_duration.total_seconds())
    hours = total_seconds // 3600
    minutes = (total_seconds % 3600) // 60
    formatted_duration = f"{hours}h {minutes}m"

    # Get overall ticket statistics
    total_tickets = Ticket.objects.filter(assigned_to=user).count()
    ticket_status_counts = Ticket.objects.filter(assigned_to=user).values('status').annotate(count=models.Count('status'))

    # Calculate total time spent on tickets
    total_time_spent = Ticket.objects.filter(assigned_to=user).aggregate(total_time=models.Sum('time_spent'))['total_time']
    total_time_spent_hours = total_time_spent.total_seconds() / 3600 if total_time_spent else 0

    # Get active tickets
    tickets = Ticket.objects.filter(
        assigned_to=user
    ).exclude(
        status__in=['closed', 'resolved']
    ).order_by('-created_at')

    # Get ticket statuses for dropdown
    ticket_statuses = Ticket._meta.get_field('status').choices

    # Get exceeded time limit tickets
    exceeded_tickets = []
    for ticket in tickets:
        if ticket.has_exceeded_time_limit():
            exceeded_tickets.append({
                'id': ticket.id,
                'ticket_id': ticket.ticket_id,
                'subject': ticket.subject,
                'priority': ticket.priority,
                'time_elapsed': timezone.now() - ticket.created_at,
                'created_at': ticket.created_at
            })

    context = {
        'employee_profile': employee_profile,
        'total_tickets': total_tickets,
        'ticket_status_counts': ticket_status_counts,
        'total_time_spent': total_time_spent_hours,
        'tickets': tickets,
        'ticket_statuses': ticket_statuses,
        'exceeded_tickets': exceeded_tickets,
        'current_time': timezone.now(),
        'todays_tickets': todays_tickets,
        'open_tickets': open_tickets,
        'closed_tickets': closed_tickets,
        'call_duration': formatted_duration
    }

    return render(request, 'testing_dashboard3.html', context)


@login_required
def get_daily_stats(request):
    """API endpoint for getting daily statistics"""
    user = request.user
    now = timezone.localtime(timezone.now())
    local_today_start = timezone.make_aware(datetime.combine(now.date(), time.min))
    local_today_end = timezone.make_aware(datetime.combine(now.date(), time.max))

    # Calculate today's tickets
    todays_tickets = Ticket.objects.filter(
        assigned_to=user,
        assigned_at__range=(local_today_start, local_today_end)
    ).count()

    # Calculate open tickets
    open_tickets = Ticket.objects.filter(
        assigned_to=user,
        assigned_at__range=(local_today_start, local_today_end),
        status='open',
        status_changed__isnull=True  # This means the status hasn't been changed
    ).count()

    # Calculate closed tickets
    closed_tickets = Ticket.objects.filter(
        assigned_to=user,
        status_changed__range=(local_today_start, local_today_end),
        status__in=['closed', 'resolved']
    ).count()

    # Calculate total call duration from both models
    total_duration = timedelta(0)

    # Add Call model durations
    calls = Call.objects.filter(
        agent=user,
        call_start_time__range=(local_today_start, local_today_end),
        call_end_time__isnull=False
    )
    for call in calls:
        if call.call_end_time and call.call_start_time:
            duration = call.call_end_time - call.call_start_time
            total_duration += duration

    # Add NewCallQuery durations
    new_calls = NewCallQuery.objects.filter(
        agent=user,
        call_start_time__range=(local_today_start, local_today_end),
        call_duration_seconds__isnull=False
    )
    for call in new_calls:
        total_duration += timedelta(seconds=call.call_duration_seconds or 0)

    # Format duration
    total_seconds = int(total_duration.total_seconds())
    formatted_duration = f"{total_seconds // 3600}h {(total_seconds % 3600) // 60}m"

    return JsonResponse({
        'todays_tickets': todays_tickets,
        'open_tickets': open_tickets,
        'closed_tickets': closed_tickets,
        'call_duration': formatted_duration
    })


@login_required
def start_end_call(request, ticket_id):
    ticket = get_object_or_404(Ticket, id=ticket_id)
    agent = request.user

    if request.method == "POST":
        action = request.POST.get('action')

        if action == "start_call" and not ticket.call_in_progress:
            # Pause any other active timers
            active_tickets = Ticket.objects.filter(
                assigned_to=agent,
                is_active=True
            ).exclude(id=ticket_id)

            for active_ticket in active_tickets:
                active_ticket.pause_for_other_call()

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
                'timer_started_by_call': timer_started_by_call,
                'paused_tickets': [t.id for t in active_tickets]  # Send paused ticket IDs
            })

        elif action == "end_call" and ticket.call_in_progress:
            # ... your existing end_call logic ...
            return JsonResponse({
                'status': 'success',
                'ticket_id': ticket.id,
                'ticket_display_id': ticket.ticket_id,
                'subject': ticket.subject,
                'current_status': ticket.status,
            })

    return JsonResponse({'status': 'error', 'message': 'Invalid request'}, status=400)


@login_required
def post_call_details(request, ticket_id):
    ticket = get_object_or_404(Ticket, id=ticket_id)

    if request.method == "POST":
        current_call = Call.objects.filter(ticket=ticket, agent=request.user).order_by('-call_start_time').first()
        note_text = request.POST.get('note')
        if note_text:
            # Save call note
            TicketNote.objects.create(
                ticket=ticket,
                note_type='call',
                note_text=note_text,
                created_by=request.user,
                call_duration=timezone.now() - ticket.call_start_time if ticket.call_start_time else None
            )

        if current_call:
            # Save call details
            current_call.call_end_time = timezone.now()
            current_call.call_note = request.POST.get('note')
            current_call.save()

            # Update ticket status if provided
            if status := request.POST.get('status'):
                ticket.status = status

            # End the call
            ticket.end_call()

            # Resume any timers that were paused by this call
            paused_tickets = Ticket.objects.filter(
                assigned_to=request.user,
                paused_by_other_call=True
            )

            for paused_ticket in paused_tickets:
                paused_ticket.resume_from_other_call()

            return JsonResponse({
                'status': 'success',
                'message': 'Post-call details saved successfully',
                'resumed_tickets': [t.id for t in paused_tickets]  # Send resumed ticket IDs
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
    users_with_calls = User.objects.filter(
        employeeprofile__is_on_call=True
    ).distinct()

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
        call_duration_seconds = request.POST.get("call_duration_seconds")
        if client_call_note:
            TicketNote.objects.create(
                ticket=ticket,
                note_type='client_call',
                note_text=client_call_note,
                created_by=request.user,
                call_duration=timedelta(seconds=float(call_duration_seconds)) if call_duration_seconds else None
            )

        # Update the ticket fields
        ticket.subject = subject
        ticket.priority = priority

        if assigned_to_id:
            assigned_user = get_object_or_404(User, id=assigned_to_id)
            ticket.assigned_to = assigned_user

        # Create a new ClientCallNote
        if client_call_note:
            ClientCallNote.objects.create(
                ticket=ticket,
                note_text=client_call_note,
                created_by=request.user,
                call_duration_seconds=call_duration_seconds if call_duration_seconds else None
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


@login_required
def start_new_call(request):
    if request.method == "POST":
        user = request.user
        try:
            employee_profile = EmployeeProfile.objects.get(user=user)
            employee_profile.is_on_call = True
            employee_profile.call_start_time = timezone.now()
            employee_profile.save()

            return JsonResponse({
                'status': 'success',
                'message': 'Call started successfully',
                'user_id': user.id,
                'call_start_time': employee_profile.call_start_time.isoformat()
            })
        except EmployeeProfile.DoesNotExist:
            return JsonResponse({
                'status': 'error',
                'message': 'Employee profile not found'
            }, status=404)

    return JsonResponse({
        'status': 'error',
        'message': 'Invalid request method'
    }, status=405)


@login_required
def end_new_call(request):
    if request.method == "POST":
        user = request.user
        try:
            employee_profile = EmployeeProfile.objects.get(user=user)
            if employee_profile.call_start_time:
                call_duration = timezone.now() - employee_profile.call_start_time
                call_duration_seconds = call_duration.total_seconds()

                employee_profile.is_on_call = False
                employee_profile.call_start_time = None
                employee_profile.save()

                return JsonResponse({
                    'status': 'success',
                    'message': 'Call ended successfully',
                    'call_duration': call_duration_seconds
                })
            else:
                return JsonResponse({
                    'status': 'error',
                    'message': 'No call start time found'
                })
        except EmployeeProfile.DoesNotExist:
            return JsonResponse({
                'status': 'error',
                'message': 'Employee profile not found'
            }, status=404)
    return JsonResponse({
        'status': 'error',
        'message': 'Invalid request method'
    }, status=405)

# views.py
@csrf_exempt
def save_new_call_query(request):
    if request.method == 'POST':
        data = request.POST
        try:
            employee_profile = EmployeeProfile.objects.get(user=request.user)

            # Create new call query
            query = NewCallQuery.objects.create(
                agent=request.user,
                client_name=data.get('client_name'),
                client_email=data.get('client_email'),
                cc_email=data.get('cc_email'),
                note=data.get('note'),
                ticket_created=data.get('create_ticket') == 'on',
                call_duration_seconds=float(data.get('call_duration_seconds', 0))
            )

            # Reset employee profile call status
            employee_profile.is_on_call = False
            employee_profile.call_start_time = None
            employee_profile.save()

            return JsonResponse({'status': 'success', 'id': query.id})
        except Exception as e:
            return JsonResponse({'status': 'error', 'message': str(e)}, status=400)
    return JsonResponse({'status': 'error'}, status=400)

def get_call_queries(request):
    new_queries = NewCallQuery.objects.filter(agent=request.user).order_by('-call_start_time')

    def format_duration(seconds):
        if seconds is None:
            return '-'
        minutes = int(seconds // 60)
        remaining_seconds = int(seconds % 60)
        return f"{minutes}m {remaining_seconds}s"

    return JsonResponse({
        'new_queries': [{
            'client_name': q.client_name,
            'client_email': q.client_email,
            'cc_email': q.cc_email,
            'call_duration': format_duration(q.call_duration_seconds),
            'ticket_created': q.ticket_created,
            'note': q.note
        } for q in new_queries]
    })



@login_required
def check_unified_notifications(request):
    user = request.user
    current_time = timezone.now()

    # Get active tickets
    active_tickets = Ticket.objects.filter(
        assigned_to=user
    ).exclude(
        status__in=['closed', 'resolved']
    )

    notifications = []

    # Check for exceeded time notifications
    for ticket in active_tickets:
        if ticket.has_exceeded_time_limit():
            notification, created = UnifiedNotification.objects.get_or_create(
                ticket=ticket,
                user=user,
                notification_type='exceeded',
                defaults={
                    'message': f'Ticket #{ticket.ticket_id} has exceeded its time limit'
                }
            )
            if notification.should_notify():
                notifications.append({
                    'type': 'exceeded',
                    'ticket_id': ticket.id,
                    'ticket_number': ticket.ticket_id,
                    'subject': ticket.subject,
                    'priority': ticket.priority,
                    'message': notification.message,
                    'created_at': ticket.created_at.isoformat()
                })
                notification.notification_count += 1
                notification.last_notification_time = current_time
                notification.save()

        # Check for pre-notifications
        elif ticket.should_send_notification():
            notification, created = UnifiedNotification.objects.get_or_create(
                ticket=ticket,
                user=user,
                notification_type='pre_notification',
                defaults={
                    'message': f'The SLA of ticket #{ticket.ticket_id} is going to end in 5 minutes'
                }
            )
            if notification.should_notify():
                notifications.append({
                    'type': 'pre_notification',
                    'ticket_id': ticket.id,
                    'ticket_number': ticket.ticket_id,
                    'subject': ticket.subject,
                    'priority': ticket.priority,
                    'message': notification.message
                })
                notification.notification_count += 1
                notification.last_notification_time = current_time
                notification.save()

    # Check pending notifications
    pending_notifications = UnifiedNotification.objects.filter(
        user=user,
        notification_type='pending',
        is_read=False
    )

    # Add checking for assigned and created notifications
    assignment_notifications = UnifiedNotification.objects.filter(
        user=user,
        notification_type__in=['assigned', 'created'],
        is_read=False
    )

    for notification in assignment_notifications:
        if notification.should_notify():
            notifications.append({
                'type': notification.notification_type,
                'ticket_id': notification.ticket.id,
                'ticket_number': notification.ticket.ticket_id,
                'subject': notification.ticket.subject,
                'priority': notification.ticket.priority,
                'message': notification.message,
                'created_at': notification.created_at.isoformat()
            })

    return JsonResponse({'notifications': notifications})


@login_required
def acknowledge_ticket(request, ticket_id):
    if request.method == 'POST':
        try:
            ticket = get_object_or_404(Ticket, id=ticket_id, assigned_to=request.user)

            # Add logging for debugging
            print(f"Acknowledging ticket {ticket_id} for user {request.user}")

            success = ticket.acknowledge(request.user)

            if success:
                # Mark related notifications as read
                UnifiedNotification.objects.filter(
                    ticket=ticket,
                    user=request.user
                ).update(is_read=True)

                return JsonResponse({
                    'success': True,
                    'message': 'Ticket acknowledged successfully'
                })
            else:
                return JsonResponse({
                    'success': False,
                    'error': 'Failed to acknowledge ticket'
                }, status=400)

        except Ticket.DoesNotExist:
            return JsonResponse({
                'success': False,
                'error': 'Ticket not found'
            }, status=404)
        except Exception as e:
            print(f"Error acknowledging ticket: {e}")
            return JsonResponse({
                'success': False,
                'error': str(e)
            }, status=500)

    return JsonResponse({
        'success': False,
        'error': 'Invalid request method'
    }, status=400)

def ticket_list(request):
    tickets = Ticket.objects.all().order_by('-created_at')
    for ticket in tickets:
        if not isinstance(ticket.time_spent, timedelta):
            ticket.time_spent = timedelta(seconds=int(ticket.time_spent.total_seconds()))
    return render(request, 'tickets.html', {'tickets': tickets})


from django.views.decorators.http import require_http_methods
@login_required
@require_http_methods(["POST"])
def generate_work_report(request):
    try:
        start_date = request.POST.get('start_date')
        end_date = request.POST.get('end_date')

        if not start_date or not end_date:
            return JsonResponse({
                'status': 'error',
                'message': 'Start date and end date are required'
            })

        start_datetime = timezone.make_aware(datetime.combine(datetime.strptime(start_date, '%Y-%m-%d'), time.min))
        end_datetime = timezone.make_aware(datetime.combine(datetime.strptime(end_date, '%Y-%m-%d'), time.max))

        daily_data = []
        current_date = start_datetime
        while current_date <= end_datetime:
            next_date = current_date + timedelta(days=1)

            # Get daily tickets data
            day_tickets = Ticket.objects.filter(
                assigned_at__range=(current_date, next_date),
                assigned_to=request.user
            ).distinct()

            resolved_tickets = Ticket.objects.filter(
                assigned_to=request.user,
                status__in=['resolved', 'closed'],
                status_changed__range=(current_date, next_date)
            )

            unresolved_tickets = Ticket.objects.filter(
                assigned_to=request.user,
                assigned_at__lte=next_date
            ).exclude(
                models.Q(
                    status__in=['resolved', 'closed'],
                    status_changed__lte=next_date
                )
            )

            # Calculate call duration
            call_duration = timedelta(0)

            # Get calls from Call model
            day_calls = Call.objects.filter(
                agent=request.user,
                call_start_time__range=(current_date, next_date),
                call_end_time__isnull=False
            )
            for call in day_calls:
                call_duration += call.call_end_time - call.call_start_time

            # Get calls from NewCallQuery model
            new_calls = NewCallQuery.objects.filter(
                agent=request.user,
                call_start_time__range=(current_date, next_date),
                call_duration_seconds__isnull=False
            )
            for call in new_calls:
                call_duration += timedelta(seconds=call.call_duration_seconds or 0)

            # Format call duration
            total_seconds = int(call_duration.total_seconds())
            hours = total_seconds // 3600
            minutes = (total_seconds % 3600) // 60
            seconds = total_seconds % 60
            formatted_duration = f"{hours:02d}:{minutes:02d}:{seconds:02d}"

            daily_data.append({
                'date': current_date.date().strftime('%Y-%m-%d'),
                'total_tickets': day_tickets.count(),
                'resolved_tickets': resolved_tickets.count(),
                'unresolved_tickets': unresolved_tickets.count(),
                'call_duration': formatted_duration,
                'call_duration_seconds': total_seconds
            })

            current_date = next_date

        # Calculate overall statistics
        total_tickets = Ticket.objects.filter(
            assigned_at__range=(start_datetime, end_datetime),
            assigned_to=request.user
        ).distinct()

        total_resolved = Ticket.objects.filter(
            assigned_to=request.user,
            status__in=['resolved', 'closed'],
            status_changed__range=(start_datetime, end_datetime)
        ).count()

        total_unresolved = Ticket.objects.filter(
            assigned_to=request.user,
            assigned_at__lte=end_datetime
        ).exclude(
            models.Q(
                status__in=['resolved', 'closed'],
                status_changed__lte=end_datetime
            )
        ).count()

        status_distribution = {
            'Total': total_tickets.count(),
            'Resolved': total_resolved,
            'Unresolved': total_unresolved
        }

        total_call_duration = sum(
            [entry['call_duration_seconds'] for entry in daily_data]
        )

        return JsonResponse({
            'status': 'success',
            'data': {
                'daily_breakdown': daily_data,
                'status_distribution': status_distribution,
                'total_call_duration': total_call_duration,
                'date_range': {
                    'start': start_date,
                    'end': end_date
                }
            }
        })

    except Exception as e:
        return JsonResponse({
            'status': 'error',
            'message': 'An error occurred while generating the report'
        })

@login_required
def work_report_view(request):
    return render(request, 'work_report.html')


@login_required
def view_ticket_notes_all(request, ticket_id):
    ticket = get_object_or_404(Ticket, id=ticket_id)

    # Get all notes for the ticket
    notes = ticket.ticket_notes.all()

    if request.method == "POST":
        note_text = request.POST.get('note')
        if note_text:
            TicketNote.objects.create(
                ticket=ticket,
                note_type='general',
                note_text=note_text,
                created_by=request.user
            )
        return redirect('view_ticket_notes_all', ticket_id=ticket_id)

    return render(request, 'all_ticket_notes.html', {
        'ticket': ticket,
        'notes': notes
    })

from rest_framework.decorators import api_view
from rest_framework.response import Response
from django.utils.dateparse import parse_datetime
from tracking.models import UserActivity


@api_view(['POST'])
def record_activity(request):
    try:
        data = request.data
        # Debug print
        print("Received activity data:", data)

        activity = UserActivity.objects.create(
            email=data['email'],
            timestamp=parse_datetime(data['timestamp']),
            is_idle=data.get('is_idle', False),
            idle_duration=data.get('idle_duration', 0)
        )
        # Debug print
        print(f"Created activity record: is_idle={activity.is_idle}, duration={activity.idle_duration}")

        return Response({'status': 'success'})
    except Exception as e:
        print(f"Error recording activity: {str(e)}")  # Debug print
        return Response({'status': 'error', 'message': str(e)}, status=400)


@login_required
def on_duty_request(request):
    if request.method == 'POST':
        form = OnDutyRequestForm(request.POST)
        if form.is_valid():
            on_duty_request = form.save(commit=False)
            on_duty_request.employee = request.user.employeeprofile
            on_duty_request.save()
            return redirect('on_duty_list')
    else:
        form = OnDutyRequestForm()

    return render(request, 'on_duty_request.html', {'form': form})


@login_required
def on_duty_list(request):
    user_profile = request.user.employeeprofile

    # Always get user's own requests
    my_requests = OnDutyRequest.objects.filter(
        employee=user_profile
    ).select_related('employee__user', 'approved_by__user')

    # Get team requests if user has team members
    team_requests = OnDutyRequest.objects.filter(
        employee__reporting_manager=user_profile
    ).select_related('employee__user', 'approved_by__user') if hasattr(user_profile, 'team_members') else None

    context = {
        'my_requests': my_requests,
        'team_requests': team_requests,
        'has_team': team_requests is not None
    }
    return render(request, 'on_duty_list.html', context)


@login_required
def on_duty_action(request, request_id):

    on_duty_request = get_object_or_404(OnDutyRequest, id=request_id)
    action = request.POST.get('action')
    comment = request.POST.get('comment')

    if action == 'approve':
        on_duty_request.status = 'approved'
    elif action == 'reject':
        on_duty_request.status = 'rejected'

    on_duty_request.approved_by = request.user.employeeprofile
    on_duty_request.comment = comment
    on_duty_request.save()
    request.session['active_tab'] = 'team-requests'
    return redirect(f"{reverse('on_duty_list')}?tab=team-requests")





