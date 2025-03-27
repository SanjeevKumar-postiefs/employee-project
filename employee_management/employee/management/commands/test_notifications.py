# employee/management/commands/test_notifications.py

from django.core.management.base import BaseCommand
from django.contrib.auth.models import User
from employee.models import UnifiedNotification
import os


class Command(BaseCommand):
    help = 'Test notification setup'

    def handle(self, *args, **kwargs):
        self.stdout.write('Testing notification setup...')

        # Check static files
        static_paths = [
            'employee/static/employee/js/notifications.js',
            'employee/static/employee/sounds/notification.mp3',
            'staticfiles/employee/js/notifications.js',
            'staticfiles/employee/sounds/notification.mp3',
        ]

        for path in static_paths:
            if os.path.exists(path):
                self.stdout.write(self.style.SUCCESS(f'✓ Found {path}'))
            else:
                self.stdout.write(self.style.ERROR(f'✗ Missing {path}'))

        # Check model
        try:
            user = User.objects.first()
            if user:
                notification = UnifiedNotification.objects.create(
                    user=user,
                    notification_type='test',
                    message='Test notification'
                )
                self.stdout.write(self.style.SUCCESS('✓ Created test notification'))
                notification.delete()
            else:
                self.stdout.write(self.style.WARNING('! No users found'))
        except Exception as e:
            self.stdout.write(self.style.ERROR(f'✗ Failed to create notification: {str(e)}'))