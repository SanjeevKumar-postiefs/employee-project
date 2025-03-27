# employee/context_processors.py

from .models import UnifiedNotification

def unread_notifications(request):
    if request.user.is_authenticated:
        notification_count = UnifiedNotification.objects.filter(
            user=request.user,
            is_read=False
        ).count()
        return {'unread_notification_count': notification_count}
    return {'unread_notification_count': 0}