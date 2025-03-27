# employee/templatetags/custom_filters.py

from django import template
from datetime import timedelta
from django.utils import timezone

register = template.Library()

@register.filter
def mod(value, arg):
    """Returns the remainder of value divided by arg."""
    return value % arg


@register.filter
def format_timedelta(value):
    if isinstance(value, timedelta):
        # Get total seconds from the timedelta
        total_seconds = int(value.total_seconds())

        # Calculate hours, minutes, and seconds
        hours = total_seconds // 3600
        minutes = (total_seconds % 3600) // 60
        seconds = total_seconds % 60

        # Format as hh:mm:ss
        if hours > 0:
            return f"{hours}h {minutes}m {seconds}s"
        elif minutes > 0:
            return f"{minutes}m {seconds}s"
        else:
            return f"{seconds}s"

    return value

@register.filter
def format_duration(seconds):
    if not seconds:
        return '-'
    try:
        seconds = float(seconds)
        minutes = int(seconds // 60)
        remaining_seconds = int(seconds % 60)
        return f"{minutes}m {remaining_seconds}s"
    except (ValueError, TypeError):
        return '-'

@register.filter(name='localize_datetime')
def localize_datetime(value):
    if value:
        return timezone.localtime(value)
    return value

@register.filter
def format_duration(duration):
    if isinstance(duration, timedelta):
        total_seconds = int(duration.total_seconds())
        hours = total_seconds // 3600
        minutes = (total_seconds % 3600) // 60
        seconds = total_seconds % 60
        return f"{hours:02d}:{minutes:02d}:{seconds:02d}"
    return "00:00:00"

@register.filter
def filter_status(status_counts, status):
    for item in status_counts:
        if item['status'] == status:
            return item['count']
    return 0

@register.filter
def multiply(value, arg):
    try:
        return float(value) * float(arg)
    except (ValueError, TypeError):
        return 0

@register.filter
def divide(value, arg):
    try:
        return float(value) / float(arg)
    except (ValueError, TypeError, ZeroDivisionError):
        return 0

@register.filter
def status_abbreviation(value):
    status_map = {
        'waiting_on_customer': 'WOC',
        'initial_response': 'IR',
        'on_hold': 'OH',
    }
    return status_map.get(value, value.title())

@register.filter
def status_full_name(value):
    status_map = {
        'waiting_on_customer': 'Waiting on Customer',
        'initial_response': 'Initial Response',
        'on_hold': 'On Hold',
    }
    return status_map.get(value, value.title())