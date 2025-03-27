from django.db import models
from django.contrib.auth.models import User
from django.utils import timezone
from datetime import timedelta, time
from django.core.exceptions import ValidationError
from tracking.models import UserActivity
from django.db.models import Sum

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

def validate_image_size(value):
    filesize = value.size
    if filesize > 5 * 1024 * 1024:  # 5MB limit
        raise ValidationError("Maximum file size is 5MB")

class EmployeeProfile(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    level = models.CharField(max_length=10, choices=LEVEL_CHOICES)
    skill = models.CharField(max_length=20, choices=SKILL_CHOICES)
    is_active = models.BooleanField(default=False)
    is_admin = models.BooleanField(default=False)
    is_on_break = models.BooleanField(default=False)
    promoted_to_admin = models.BooleanField(default=False)
    total_time = models.DecimalField(max_digits=10, decimal_places=2, default=0.0)
    is_idle = models.BooleanField(default=False)
    last_activity = models.DateTimeField(auto_now=True)
    status = models.CharField(max_length=20, choices=[
        ('active', 'Active'),
        ('on_break', 'On Break'),
        ('idle', 'Idle'),
        ('offline', 'Offline')
    ], default='offline')
    is_on_call = models.BooleanField(default=False)
    call_start_time = models.DateTimeField(null=True, blank=True)
    profile_picture = models.ImageField(
        upload_to='profile_pictures/',
        null=True,
        blank=True,
        validators=[validate_image_size],
        help_text="Upload a profile picture (max 5MB)"
    )
    reporting_manager = models.ForeignKey(
        'self',
        on_delete=models.SET_NULL,
        null=True,
        blank=True,
        related_name='team_members'
    )


    @classmethod
    def get_active_users_in_skill(cls, skill):
        """Get count of active users in a specific skill group"""
        return cls.objects.filter(
            skill=skill,
            is_active=True
        ).count()

    @classmethod
    def get_users_on_break_in_skill(cls, skill):
        """Get count of users currently on break in a specific skill group"""
        return cls.objects.filter(
            skill=skill,
            is_active=True,
            is_on_break=True
        ).count()

    @classmethod
    def can_take_break(cls, skill):
        """
        Check if another user can take a break based on active users count.
        Returns (bool, str) tuple: (can_take_break, message)
        """
        active_users = cls.get_active_users_in_skill(skill)
        users_on_break = cls.get_users_on_break_in_skill(skill)

        if active_users <= 1:
            return True, None  # Single user can always take break

        max_users_on_break = active_users // 2  # Integer division

        if users_on_break >= max_users_on_break:
            remaining_users = active_users - users_on_break
            return False, f"⚠️ Sorry, with {active_users} active team members, only {max_users_on_break} can be on break at a time. Please wait for others to return. {remaining_users} team members need to be available. 🙏"

        return True, None


class DailyActivity(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    date = models.DateField(default=timezone.now)
    login_time = models.DateTimeField(null=True, blank=True)
    logout_time = models.DateTimeField(null=True, blank=True)
    break_duration = models.DurationField(default=timezone.timedelta)
    total_work_time = models.DurationField(default=timezone.timedelta)
    total_idle_time = models.DurationField(default=timezone.timedelta)


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

    def calculate_total_idle_time(self):
        # Get the idle time directly from UserActivity
        from tracking.models import UserActivity

        total_idle_seconds = UserActivity.objects.filter(
            email=self.user.email,
            date=self.date,  # Using the date field from UserActivity
            is_idle=False  # Only get entries when user becomes active as they contain the idle duration
        ).aggregate(
            total_idle=Sum('idle_duration')
        )['total_idle'] or 0

        return timezone.timedelta(seconds=float(total_idle_seconds))

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
        ('on_hold', 'On Hold'),
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
        Acknowledge the ticket and update notifications
        """
        try:
            if self.assigned_to == user:
                self.is_acknowledged = True
                self.acknowledged_at = timezone.now()
                self.save()

                # Update unified notifications
                UnifiedNotification.objects.filter(
                    ticket=self,
                    user=user
                ).update(is_read=True)
                return True
        except Exception as e:
            print(f"Error acknowledging ticket: {e}")
            return False

    def reset_acknowledgment(self):
        """
        Reset acknowledgment when ticket is reassigned
        """
        self.is_acknowledged = False
        self.acknowledged_at = None
        self.save()

        # Clear any existing notifications
        UnifiedNotification.objects.filter(ticket=self).delete()


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



class UnifiedNotification(models.Model):
    NOTIFICATION_TYPES = [
        ('exceeded', 'Exceeded SLA'),
        ('pre_notification', '5-min Warning'),
        ('pending', 'Pending'),
        ('assigned', 'Ticket Assigned'),
        ('created', 'Ticket Created')
    ]

    ticket = models.ForeignKey(Ticket, on_delete=models.CASCADE, related_name='unified_notifications')
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    notification_type = models.CharField(max_length=20, choices=NOTIFICATION_TYPES)
    message = models.TextField()
    created_at = models.DateTimeField(auto_now_add=True)
    is_read = models.BooleanField(default=False)
    last_notification_time = models.DateTimeField(auto_now_add=True)
    notification_count = models.IntegerField(default=0)

    class Meta:
        ordering = ['-created_at']
        unique_together = ['ticket', 'user', 'notification_type']

    def should_notify(self):
        """Determine if notification should be sent based on type"""
        now = timezone.now()
        time_diff = now - self.last_notification_time

        if self.notification_type == 'exceeded':
            return time_diff.total_seconds() >= 300  # Every 5 minutes
        elif self.notification_type == 'pre_notification':
            return time_diff.total_seconds() >= 60   # Every minute
        elif self.notification_type == 'pending':
            return time_diff.total_seconds() >= 30   # Every 30 seconds
        elif self.notification_type in ['assigned', 'created']:
            return True  # Always notify for these types
        return False

class WorkReport(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    start_date = models.DateField()
    end_date = models.DateField()
    total_tickets = models.IntegerField(default=0)
    resolved_tickets = models.IntegerField(default=0)
    pending_tickets = models.IntegerField(default=0)
    total_call_duration = models.DurationField(default=timedelta(0))
    generated_at = models.DateTimeField(auto_now_add=True)

    class Meta:
        ordering = ['-generated_at']

    def __str__(self):
        return f"Work Report for {self.user.username} ({self.start_date} to {self.end_date})"

class TicketNote(models.Model):
    ticket = models.ForeignKey(Ticket, on_delete=models.CASCADE, related_name='ticket_notes')
    note_type = models.CharField(max_length=50, choices=[
        ('creation', 'Creation Note'),
        ('reassignment', 'Reassignment Note'),
        ('call', 'Call Note'),
        ('client_call', 'Client Call Note'),
        ('general', 'General Note')
    ])
    note_text = models.TextField()
    created_by = models.ForeignKey(User, on_delete=models.SET_NULL, null=True)
    created_at = models.DateTimeField(auto_now_add=True)
    call_duration = models.DurationField(null=True, blank=True)

    class Meta:
        ordering = ['-created_at']

    def __str__(self):
        return f"{self.note_type} note for Ticket {self.ticket.ticket_id} by {self.created_by}"


class OnDutyRequest(models.Model):
    STATUS_CHOICES = [
        ('pending', 'Pending'),
        ('approved', 'Approved'),
        ('rejected', 'Rejected'),
    ]

    employee = models.ForeignKey(
        EmployeeProfile,
        on_delete=models.CASCADE,
        related_name='duty_requests'
    )
    start_date = models.DateField()
    end_date = models.DateField()
    start_time = models.TimeField(default=time(9, 0),null=True,blank=True)
    end_time = models.TimeField(default=time(18, 0),null=True,blank=True)
    reason = models.TextField()
    status = models.CharField(
        max_length=20,
        choices=STATUS_CHOICES,
        default='pending'
    )
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    approved_by = models.ForeignKey(
        EmployeeProfile,
        on_delete=models.SET_NULL,
        null=True,
        blank=True,
        related_name='approved_requests'
    )
    comment = models.TextField(blank=True, null=True)

    def __str__(self):
        return f"On Duty Request by {self.employee} ({self.status})"

    class Meta:
        ordering = ['-created_at']