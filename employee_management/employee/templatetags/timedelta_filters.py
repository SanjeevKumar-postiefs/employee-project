from django import template

register = template.Library()


@register.filter
def format_timedelta(td):
    if not td:
        return "No duration"

    days = td.days
    hours, remainder = divmod(td.seconds, 3600)
    minutes, seconds = divmod(remainder, 60)

    duration_parts = []
    if days > 0:
        duration_parts.append(f"{days} day{'s' if days > 1 else ''}")
    if hours > 0:
        duration_parts.append(f"{hours} hour{'s' if hours > 1 else ''}")
    if minutes > 0:
        duration_parts.append(f"{minutes} minute{'s' if minutes > 1 else ''}")
    if seconds > 0:
        duration_parts.append(f"{seconds} second{'s' if seconds > 1 else ''}")

    return ', '.join(duration_parts) if duration_parts else "0 seconds"
