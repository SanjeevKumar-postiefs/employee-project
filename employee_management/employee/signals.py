# signals.py
from django.contrib.auth.signals import user_logged_out,user_logged_in
from django.dispatch import receiver
from .models import EmployeeProfile,DailyActivity,SessionActivity,Ticket
from django.contrib.auth.models import User
from django.utils import timezone
from django.db.models.signals import post_save

@receiver(user_logged_out)
def set_inactive(sender, request, user, **kwargs):
    try:
        profile = EmployeeProfile.objects.select_related('user').get(user=user)
        profile.is_active = False
        profile.save()
    except EmployeeProfile.DoesNotExist:
        pass

logged_in_users = set()

@receiver(user_logged_in)
def on_user_logged_in(sender, request, user, **kwargs):
    logged_in_users.add(user)

@receiver(user_logged_out)
def on_user_logged_out(sender, request, user, **kwargs):
    logged_in_users.discard(user)

@receiver(user_logged_in)
def on_user_logged_in(sender, request, user, **kwargs):
    today = timezone.now().date()

    # --- DailyActivity: Daily summary ---
    activity, created = DailyActivity.objects.get_or_create(
        user=user,
        date=today,
        defaults={
            'login_time': timezone.now(),
            'logout_time': None,
            'break_duration': timezone.timedelta(0),
            'total_work_time': timezone.timedelta(0),
        }
    )

    if not created:
        activity.login_time = timezone.now()
        activity.logout_time = None  # Clear logout time for new session
    activity.save()

    # --- SessionActivity: Track individual sessions ---
    SessionActivity.objects.create(
        user=user,
        date=today,
        login_time=timezone.now(),
        logout_time=None,  # Will be set during logout
        break_duration=timezone.timedelta(0),
        work_time=timezone.timedelta(0)
    )

@receiver(user_logged_out)
def on_user_logged_out(sender, request, user, **kwargs):
    today = timezone.now().date()

    # --- DailyActivity: Update the logout time only, no work time accumulation ---
    try:
        activity = DailyActivity.objects.filter(user=user, date=today, logout_time=None).latest('login_time')
        activity.logout_time = timezone.now()
        activity.save()
    except DailyActivity.DoesNotExist:
        pass

    # --- SessionActivity: Track individual sessions ---
    try:
        session_activity = SessionActivity.objects.filter(user=user, date=today, logout_time=None).latest('login_time')
        session_activity.logout_time = timezone.now()
        session_activity.work_time = session_activity.calculate_work_time()  # Calculate work time for the session
        session_activity.save()
    except SessionActivity.DoesNotExist:
        pass


@receiver(post_save, sender=EmployeeProfile)
def handle_break_status_change(sender, instance, **kwargs):
    if instance.is_on_break:
        # If the user is now on break, record the break start time
        today = timezone.now().date()
        try:
            current_session = SessionActivity.objects.filter(user=instance.user, date=today, logout_time=None).latest(
                'login_time')

            if current_session.break_start_time is None:  # Only record the break start time once
                current_session.break_start_time = timezone.now()  # Record the time when break starts
                current_session.save()

        except SessionActivity.DoesNotExist:
            pass  # No active session found, nothing to update

    else:
        # If the user is no longer on break, calculate the break duration and update it
        today = timezone.now().date()
        try:
            current_session = SessionActivity.objects.filter(user=instance.user, date=today, logout_time=None).latest(
                'login_time')

            if current_session.break_start_time is not None:
                # Calculate the break duration by subtracting break start time from current time
                break_duration = timezone.now() - current_session.break_start_time
                current_session.break_duration += break_duration  # Add break duration to the session's total break time
                current_session.break_start_time = None  # Reset the break start time after break ends
                current_session.work_time = current_session.calculate_work_time()  # Recalculate work time with updated break duration
                current_session.save()

        except SessionActivity.DoesNotExist:
            pass

