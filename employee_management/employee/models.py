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
    is_on_call = models.BooleanField(default=False)
    call_start_time = models.DateTimeField(null=True, blank=True)


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
    ENVIRONMENT_CHOICES = [
        ('postiefs', 'Postiefs'),
        ('aws', 'AWS'),
        ('azure', 'Azure'),
        ('oracle', 'Oracle'),
        ('google', 'Google'),
    ]
    environment = models.CharField(
        max_length=50,
        choices=ENVIRONMENT_CHOICES,
        default='postiefs',  # Setting Postiefs as default
        help_text="Select the cloud environment"
    )
    user = models.ForeignKey(User, on_delete=models.CASCADE, null=True, related_name='user_tickets')
    created_by = models.ForeignKey(User, on_delete=models.CASCADE, related_name='created_tickets')
    assigned_to = models.ForeignKey(User, on_delete=models.SET_NULL, null=True, blank=True,
                                    related_name='assigned_tickets')
    assigned_by = models.ForeignKey(User, on_delete=models.SET_NULL, null=True, blank=True,
                                    related_name='assigner_tickets')
    created_at = models.DateTimeField(editable=False)
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
    paused_by_other_call = models.BooleanField(default=False)
    paused_time = models.DateTimeField(null=True, blank=True)
    status_changed = models.DateTimeField(null=True, blank=True)
    is_acknowledged = models.BooleanField(default=False)
    acknowledged_at = models.DateTimeField(null=True, blank=True)

    def save(self, *args, **kwargs):
        if not self.id:  # Only set the created_at time when the object is first created
            self.created_at = timezone.localtime(timezone.now())
        super().save(*args, **kwargs)

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

    def pause_for_other_call(self):
        """Pause the timer because of another call"""
        if self.is_active and not self.paused_by_other_call:
            self.paused_time = timezone.now()
            self.paused_by_other_call = True
            self.is_active = False
            self.save()

    def resume_from_other_call(self):
        """Resume the timer after other call ends"""
        if self.paused_by_other_call:
            self.is_active = True
            self.paused_by_other_call = False
            # Update work_start_time to maintain accurate duration
            if self.paused_time:
                time_diff = timezone.now() - self.paused_time
                self.work_start_time = self.work_start_time + time_diff
            self.paused_time = None
            self.save()

    def __str__(self):
        return self.subject

    def get_priority_threshold(self):
        """Returns the time threshold for the ticket's priority"""
        thresholds = {
            'urgent': timedelta(minutes=15),
            'high': timedelta(minutes=30),
            'medium': timedelta(hours=1),
            'low': timedelta(hours=2)
        }
        return thresholds.get(self.priority.lower())

    def has_exceeded_time_limit(self):
        """Checks if the ticket has exceeded its time limit"""
        if not self.created_at:
            return False

        threshold = self.get_priority_threshold()
        if not threshold:
            return False

        time_elapsed = timezone.now() - self.created_at
        return time_elapsed > threshold

    def get_priority_class(self):
        """Returns the CSS class for the ticket's priority status"""
        if self.has_exceeded_time_limit():
            base_class = f'priority-{self.priority.lower()}'
            if not self.status_changed or (
                self.status_changed and
                (timezone.now() - self.status_changed) > timezone.timedelta(minutes=1)
            ):
                return f'priority-alert {base_class}'
            return base_class
        return ''

    def should_send_notification(self):
        """Check if we should send a pre-notification"""
        if not self.created_at:
            return False

        threshold = self.get_priority_threshold()
        if not threshold:
            return False

        time_elapsed = timezone.now() - self.created_at
        notification_threshold = threshold - timezone.timedelta(minutes=5)  # 5 minutes before

        return (time_elapsed >= notification_threshold and
                time_elapsed < threshold and
                not self.status_changed)

    def should_color_individual_time(self):
        """Determines if the individual time column should be colored"""
        if not self.has_exceeded_time_limit():
            return False
        if not self.status_changed:
            return True
        # Check if status was changed after the time limit was exceeded
        time_elapsed = timezone.now() - self.created_at
        threshold = self.get_priority_threshold()
        if threshold and time_elapsed > threshold:
            return False
        return True

    def acknowledge(self, user):
        """
        Acknowledge the ticket and create a notification if needed
        """
        if self.assigned_to == user:
            # Only acknowledge if the current user is the assigned user
            self.is_acknowledged = True
            self.acknowledged_at = timezone.now()
            self.save()

            # Clear any pending notifications for this ticket
            TicketNotification.objects.filter(
                ticket=self,
                user=user,
                is_read=False
            ).update(is_read=True)

    def reset_acknowledgment(self):
        """
        Reset acknowledgment when ticket is reassigned
        """
        self.is_acknowledged = False
        self.acknowledged_at = None
        self.save()


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
    call_duration_seconds = models.FloatField(null=True, blank=True)

    class Meta:
        ordering = ['-created_at']

    def __str__(self):
        return f"Client Call Note for {self.ticket.ticket_id} at {self.created_at}"


class NewCallQuery(models.Model):
    agent = models.ForeignKey(User, on_delete=models.SET_NULL, null=True, related_name='new_call_queries')
    primary_email = models.EmailField(default='levelone@example.com')  # Fixed LEVELONE team email
    client_name = models.CharField(max_length=255,null=True, blank=True)
    client_email = models.EmailField()
    cc_email = models.EmailField(blank=True, null=True)
    note = models.TextField()
    call_start_time = models.DateTimeField(auto_now_add=True)
    call_end_time = models.DateTimeField(null=True, blank=True)
    ticket_created = models.BooleanField(default=False)
    call_duration_seconds = models.FloatField(null=True, blank=True)

    @property
    def call_duration(self):
        if self.call_end_time:
            return self.call_end_time - self.call_start_time
        return None

    def __str__(self):
        return f"Call Query from {self.client_email} at {self.call_start_time}"

class TicketNotification(models.Model):
    ticket = models.ForeignKey(Ticket, on_delete=models.CASCADE, related_name='notifications')
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    message = models.TextField()
    created_at = models.DateTimeField(auto_now_add=True)
    is_read = models.BooleanField(default=False)
    last_notified = models.DateTimeField(auto_now_add=True)
    notification_counter = models.IntegerField(default=0)
    last_notification_time = models.DateTimeField(auto_now_add=True)

    def should_resend(self):
        if not self.is_read:
            now = timezone.now()
            time_diff = now - self.last_notification_time
            return time_diff.total_seconds() >= 60  # Check if a minute has passed

    class Meta:
        ordering = ['-created_at']

class TicketAlert(models.Model):
    ticket = models.ForeignKey(Ticket, on_delete=models.CASCADE, related_name='alerts')
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    created_at = models.DateTimeField(auto_now_add=True)
    acknowledged = models.BooleanField(default=False)
    last_alert_time = models.DateTimeField(auto_now_add=True)
    alert_count = models.IntegerField(default=0)

    class Meta:
        ordering = ['-created_at']
        unique_together = ['ticket', 'user']

    @classmethod
    def cleanup_old_alerts(cls):
        # Remove alerts that are older than 24 hours and acknowledged
        cleanup_date = timezone.now() - timezone.timedelta(hours=24)
        cls.objects.filter(
            acknowledged=True,
            created_at__lt=cleanup_date
        ).delete()