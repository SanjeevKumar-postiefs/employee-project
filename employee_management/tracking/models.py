from django.db import models
from django.contrib.auth.models import User
from django.utils import timezone

class UserActivity(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE, null=True, blank=True)
    timestamp = models.DateTimeField(null=True,blank=True)
    created_at = models.DateTimeField(auto_now_add=True, null=True, blank=True)
    email = models.EmailField(max_length=255, null=True, blank=True)
    is_idle = models.BooleanField(default=False)
    idle_duration = models.FloatField(default=0)  # Store idle duration in seconds
    idle_start_time = models.DateTimeField(null=True, blank=True)
    time_of_day = models.TimeField(default=timezone.now)
    date = models.DateField(default=timezone.now)
    hostname = models.CharField(max_length=255, null=True, blank=True)

    class Meta:
        ordering = ['-timestamp']
        verbose_name_plural = 'User Activities'
        indexes = [
            models.Index(fields=['email', 'date', 'time_of_day']),
        ]

    def save(self, *args, **kwargs):
        if self.timestamp:
            self.date = self.timestamp.date()
            self.time_of_day = self.timestamp.time()
        super().save(*args, **kwargs)

    def __str__(self):
        return f"{self.email} - {self.timestamp}"

class ActivityReport(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    date = models.DateField()
    total_active_time = models.DurationField()
    total_idle_time = models.DurationField()
    activity_summary = models.JSONField()

    class Meta:
        unique_together = ['user', 'date']