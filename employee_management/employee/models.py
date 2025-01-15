from django.db import models
from django.contrib.auth.models import User
from django.utils import timezone
from datetime import timedelta

LEVEL_CHOICES = (
    ('1', 'Level 1'),
)

SKILL_CHOICES = (
    ('Linux', 'Linux'),
    ('Windows', 'Windows/Azure'),
    ('AWS', 'Network/AWS'),
    ('LEVELONE', 'Level One'),
    ('OCI', 'OCI'),
)

class EmployeeProfile(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    level = models.CharField(max_length=10, choices=LEVEL_CHOICES)
    skill = models.CharField(max_length=20, choices=SKILL_CHOICES)
    is_active = models.BooleanField(default=False)
    is_admin = models.BooleanField(default=False)
    is_on_break = models.BooleanField(default=False)
    promoted_to_admin = models.BooleanField(default=False)
    total_time = models.DecimalField(max_digits=10, decimal_places=2, default=0.0)
    status = models.CharField(max_length=20, choices=[
        ('active', 'Active'),
        ('on_break', 'On Break'),
        ('offline', 'Offline')
    ], default='offline')


class DailyActivity(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    date = models.DateField(default=timezone.now)
    login_time = models.DateTimeField(null=True, blank=True)
    logout_time = models.DateTimeField(null=True, blank=True)
    break_duration = models.DurationField(default=timezone.timedelta)
    total_work_time = models.DurationField(default=timezone.timedelta)


    def calculate_total_work_time(self):
        # Calculate total work time by summing all session times from SessionActivity for the user on this date
        sessions = SessionActivity.objects.filter(user=self.user, date=self.date)
        total_work_time = timezone.timedelta()
        for session in sessions:
            total_work_time += session.work_time
        return total_work_time

    def calculate_total_break_time(self):
        # Sum up break durations from all sessions for this user on the same date
        sessions = SessionActivity.objects.filter(user=self.user, date=self.date)
        total_break_time = timezone.timedelta()
        for session in sessions:
            total_break_time += session.break_duration
        return total_break_time

    def __str__(self):
        return f"{self.user.username} - {self.date}"


class SessionActivity(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    date = models.DateField(default=timezone.now)
    login_time = models.DateTimeField(null=True, blank=True)
    logout_time = models.DateTimeField(null=True, blank=True)
    break_start_time = models.DateTimeField(null=True, blank=True)
    break_duration = models.DurationField(default=timezone.timedelta)
    work_time = models.DurationField(default=timezone.timedelta)  # Work time for this session

    def calculate_work_time(self):
        if self.login_time and self.logout_time:
            session_time = self.logout_time - self.login_time
            return session_time - self.break_duration
        return timezone.timedelta()  # Return 0 if the session is incomplete

    def __str__(self):
        return f"{self.user.username} - Session on {self.date}"


class Ticket(models.Model):
    ticket_id = models.CharField(max_length=10, unique=True)
    subject = models.CharField(max_length=300)
    status = models.CharField(max_length=50, choices=[
        ('open', 'Open'),
        ('pending', 'Pending'),
        ('resolved', 'Resolved'),
        ('closed', 'Closed'),
        ('waiting_on_customer', 'Waiting on Customer'),
        ('initial_response', 'Initial Response'),
    ])
    group = models.CharField(max_length=100, choices=[
        ('Linux', 'Linux'),
        ('Windows', 'Windows/Azure'),
        ('AWS', 'Network/AWS'),
        ('LEVELONE', 'Level One'),
        ('OCI', 'OCI'),
    ])
    PRIORITY_CHOICES = [
        ('low', 'Low'),
        ('medium', 'Medium'),
        ('high', 'High'),
        ('urgent', 'Urgent'),
    ]
    user = models.ForeignKey(User, on_delete=models.CASCADE, null=True, related_name='user_tickets')
    created_by = models.ForeignKey(User, on_delete=models.CASCADE, related_name='created_tickets')
    assigned_to = models.ForeignKey(User, on_delete=models.SET_NULL, null=True, blank=True,
                                    related_name='assigned_tickets')
    assigned_by = models.ForeignKey(User, on_delete=models.SET_NULL, null=True, blank=True,
                                    related_name='assigner_tickets')
    created_at = models.DateTimeField(auto_now_add=True)
    assigned_at = models.DateTimeField(null=True, blank=True)
    priority = models.CharField(max_length=10, choices=PRIORITY_CHOICES, default='low')
    note = models.TextField(blank=True)
    client_call_note = models.TextField(blank=True)
    work_start_time = models.DateTimeField(null=True, blank=True)  # When the user clicks start
    time_spent = models.DurationField(default=timezone.timedelta(0))
    individual_time_spent = models.DurationField(default=timezone.timedelta(0))
    is_active = models.BooleanField(default=False)
    call_start_time = models.DateTimeField(null=True, blank=True)  # Call start time
    call_end_time = models.DateTimeField(null=True, blank=True)  # Call end time
    call_duration = models.DurationField(default=timezone.timedelta(0))  # Total call duration
    call_note = models.TextField(blank=True)  # Note for what happened during the call
    call_in_progress = models.BooleanField(default=False)
    call_timer_started_by_call = models.BooleanField(default=False)
    last_break_time = models.DateTimeField(null=True, blank=True)  # To track when the break started
    break_duration = models.DurationField(default=timezone.timedelta(0))

    def start_work(self):
        """Start the timer for this ticket."""
        if not self.is_active:
            self.work_start_time = timezone.now()
            self.is_active = True
            self.break_duration = timezone.timedelta(0)  # Reset break duration
            self.save()

    def pause_work(self):
        """Pause the timer and accumulate the time spent up to the break."""
        if self.is_active and self.work_start_time:
            # Calculate work duration, subtract break duration if applicable
            work_duration = timezone.now() - self.work_start_time - self.break_duration
            self.time_spent += work_duration
            self.individual_time_spent += work_duration

            # Reset work_start_time to stop counting time
            self.work_start_time = None
            self.break_duration = timezone.timedelta(0)  # Reset break duration after pause
            self.is_active = False
            self.save()

    def resume_work(self):
        """Resume the work after a break."""
        if not self.is_active:
            # Start tracking time again from now, continuing after the break
            self.work_start_time = timezone.now()
            self.is_active = True
            self.save()

    def stop_work(self):
        """Stop the timer and accumulate the time spent, including after the break."""
        if self.is_active:
            # Pause and accumulate time spent before stopping
            self.pause_work()
            self.save()

    def toggle_break(self):
        """Handle the break toggling logic."""
        if self.is_active:
            if self.last_break_time:
                # Coming back from break, calculate the break duration and subtract it from the work time
                break_time = timezone.now() - self.last_break_time
                self.break_duration += break_time  # Track the total break time
                self.last_break_time = None  # Reset the break time

                # Resume work
                self.work_start_time = timezone.now()  # Mark the new start time after the break
            else:
                # Going on break, just set the break start time
                self.last_break_time = timezone.now()
            self.save()

    def reset_individual_time_spent(self):
        """Reset the individual time spent when the ticket is reassigned."""
        self.individual_time_spent = timezone.timedelta(0)
        self.save()


    # Method to start a call
    def start_call(self):
        self.call_in_progress = True
        self.call_start_time = timezone.now()
        self.call_end_time = None
        self.call_duration = None

        # Set the flag and start timer if it's not running
        if not self.is_active:
            self.call_timer_started_by_call = True
            self.start_work()
        else:
            # Timer was already running
            self.call_timer_started_by_call = False

        self.save()
        return self.call_timer_started_by_call  # Return the flag status

    def end_call(self):
        """End the call and handle timer if needed"""
        if self.call_in_progress:
            self.call_end_time = timezone.now()
            if self.call_start_time:
                self.call_duration = self.call_end_time - self.call_start_time

            # Stop timer if it was started by this call
            if self.call_timer_started_by_call:
                self.stop_work()
                self.call_timer_started_by_call = False

            self.call_in_progress = False
            self.save()

    def __str__(self):
        return self.subject


class Notification(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE, related_name="notifications")
    message = models.TextField()
    is_read = models.BooleanField(default=False)
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"Notification for {self.user.username}: {self.message}"


class CallNote(models.Model):
    agent = models.ForeignKey(User, on_delete=models.SET_NULL, null=True, blank=True)
    client_email = models.EmailField()
    note = models.TextField()
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"Note by {self.agent.username} for {self.client_email}"


class Call(models.Model):
    ticket = models.ForeignKey(Ticket, on_delete=models.CASCADE, related_name='calls')
    agent = models.ForeignKey(User, on_delete=models.SET_NULL, null=True, blank=True)
    call_start_time = models.DateTimeField(auto_now_add=True)
    call_end_time = models.DateTimeField(null=True, blank=True)
    call_note = models.TextField(null=True, blank=True)  # Make it nullable

    @property
    def call_duration(self):
        if self.call_end_time:
            return self.call_end_time - self.call_start_time
        return None

    def __str__(self):
        return f"Call for Ticket {self.ticket.ticket_id}"

class ClientCallNote(models.Model):
    ticket = models.ForeignKey(Ticket, on_delete=models.CASCADE, related_name='client_call_notes')
    note_text = models.TextField()
    created_by = models.ForeignKey(User, on_delete=models.SET_NULL, null=True, blank=True)
    created_at = models.DateTimeField(auto_now_add=True)

    class Meta:
        ordering = ['-created_at']

    def __str__(self):
        return f"Client Call Note for {self.ticket.ticket_id} at {self.created_at}"