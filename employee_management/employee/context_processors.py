from .models import TicketNotification


def unread_notifications(request):
    if request.user.is_authenticated:
        notifications = TicketNotification.objects.filter(user=request.user, is_read=False)
    else:
        notifications = []

    return {
        'notifications': notifications
    }
