# management/commands/cleanup_duplicate_alerts.py
from django.core.management.base import BaseCommand
from django.db.models import Count
from employee.models import TicketAlert


class Command(BaseCommand):
    help = 'Cleans up duplicate ticket alerts'

    def handle(self, *args, **options):
        # Find duplicates
        duplicates = TicketAlert.objects.values('ticket', 'user').annotate(
            count=Count('id')
        ).filter(count__gt=1)

        for dup in duplicates:
            # Keep the most recent alert and delete others
            alerts = TicketAlert.objects.filter(
                ticket_id=dup['ticket'],
                user_id=dup['user']
            ).order_by('-created_at')

            # Keep the first one, delete the rest
            keep = alerts.first()
            alerts.exclude(id=keep.id).delete()

        self.stdout.write(self.style.SUCCESS('Successfully cleaned up duplicate alerts'))