# templatetags/ticket_tags.py
from django import template
from django.utils import timezone
from employee.models import TicketTimeTracking
register = template.Library()



@register.filter
def get_user_time_spent(ticket, user):
    time_track = TicketTimeTracking.objects.filter(ticket=ticket, user=user).first()
    return time_track.time_spent if time_track else timezone.timedelta(0)