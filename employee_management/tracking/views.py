from rest_framework import viewsets, permissions
from rest_framework.decorators import api_view, permission_classes
from rest_framework.response import Response
from django.utils import timezone
from django.views.generic import TemplateView
from django.utils.decorators import method_decorator
from django.db.models import Count, Q, Case, When, IntegerField, Sum, F
from django.utils.timezone import make_aware, is_naive
from django.contrib.auth.models import User
from datetime import datetime
from .models import UserActivity
from .decorators import admin_required
import logging
from employee.models import EmployeeProfile

logger = logging.getLogger(__name__)


@api_view(['POST'])
@permission_classes([])
def record_activity(request):
    try:
        data = request.data
        email = data.get('email')
        hostname = data.get('hostname')

        if not email:
            return Response({
                'status': 'error',
                'message': 'Email not provided'
            }, status=400)

        try:
            user = User.objects.get(email=email)
            employee_profile = EmployeeProfile.objects.get(user=user)

            is_idle = data.get('is_idle', False)
            employee_profile.is_idle = is_idle
            if is_idle:
                employee_profile.status = 'idle'
            elif employee_profile.status == 'idle':  # Only change if current status is idle
                employee_profile.status = 'active'
            employee_profile.save()
        except User.DoesNotExist:
            user = None

        timestamp = data.get('timestamp')
        if timestamp:
            timestamp = datetime.fromisoformat(timestamp.replace('Z', '+00:00'))
            if is_naive(timestamp):
                timestamp = make_aware(timestamp)
        else:
            timestamp = timezone.now()

        idle_start_time = data.get('idle_start_time')
        if idle_start_time:
            idle_start_time = datetime.fromisoformat(idle_start_time.replace('Z', '+00:00'))
            if is_naive(idle_start_time):
                idle_start_time = make_aware(idle_start_time)

        activity = UserActivity.objects.create(
            user=user,
            email=email,
            timestamp=timestamp,
            is_idle=data.get('is_idle', False),
            idle_duration=float(data.get('idle_duration', 0)),
            idle_start_time=idle_start_time,
            hostname = hostname
        )

        return Response({'status': 'success', 'activity_id': activity.id})

    except Exception as e:
        logger.error(f"Error recording activity: {str(e)}")
        return Response({'status': 'error', 'message': str(e)}, status=400)


@method_decorator(admin_required, name='dispatch')
class ActivityDashboardView(TemplateView):
    template_name = 'tracking/user_dashboard.html'

    def format_duration(self, seconds):
        """Convert seconds to human readable format (minutes and seconds)"""
        if seconds is None or seconds == 0:
            return "-"

        # Calculate minutes and remaining seconds
        total_minutes = int(seconds // 60)
        remaining_seconds = int(seconds % 60)

        # Format hours, minutes and seconds if needed
        if total_minutes >= 60:
            hours = total_minutes // 60
            minutes = total_minutes % 60
            if minutes == 0 and remaining_seconds == 0:
                return f"{hours}h"
            elif remaining_seconds == 0:
                return f"{hours}h {minutes}m"
            else:
                return f"{hours}h {minutes}m {remaining_seconds}s"
        elif total_minutes > 0:
            if remaining_seconds == 0:
                return f"{total_minutes}m"
            else:
                return f"{total_minutes}m {remaining_seconds}s"
        else:
            return f"{remaining_seconds}s"

    def get_daily_summary(self, activities):
        # Only consider activities where is_idle=False as they contain the correct duration
        summary = (
            activities.filter(is_idle=False)  # Only get entries when user becomes active
            .values('date', 'email', 'hostname')
            .annotate(
                activity_count=Count('id'),
                total_idle_time=Sum('idle_duration'),  # Sum the idle_duration directly
                total_active_time=Count('id')  # Count of active sessions
            )
            .order_by('-date')
        )

        for item in summary:
            item['idle_time'] = self.format_duration(item['total_idle_time'])
            item['active_time'] = self.format_duration(item['total_active_time'] * 60)

        return summary

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        try:
            # Get filter parameters
            user_id = self.request.GET.get('user')
            selected_date = self.request.GET.get('selected_date', timezone.localtime().date().isoformat())
            time_from = self.request.GET.get('time_from', '00:00')
            time_to = self.request.GET.get('time_to', '23:59')

            # Base queryset
            activities = UserActivity.objects.all()

            # Apply date/time filters
            if selected_date:
                try:
                    start_date = make_aware(datetime.strptime(f"{selected_date} {time_from}", "%Y-%m-%d %H:%M"))
                    end_date = make_aware(datetime.strptime(f"{selected_date} {time_to}", "%Y-%m-%d %H:%M"))
                    activities = activities.filter(timestamp__gte=start_date, timestamp__lte=end_date)
                except ValueError:
                    today = timezone.localtime().date()
                    activities = activities.filter(date=today)

            if user_id:
                try:
                    user = User.objects.get(id=user_id)
                    # Only get entries where is_idle=False as they contain the correct duration
                    user_activities = activities.filter(
                        Q(user_id=user_id) | Q(email=user.email),
                        is_idle=False  # Only get entries when user becomes active
                    ).order_by('-timestamp')

                    # Format idle duration for display
                    for activity in user_activities:
                        activity.formatted_idle_duration = self.format_duration(activity.idle_duration)

                except User.DoesNotExist:
                    user_activities = []
            else:
                user_activities = None
                daily_summary = self.get_daily_summary(activities)

            # Get active users count for today
            today_start = timezone.localtime().replace(hour=0, minute=0, second=0, microsecond=0)
            active_today = UserActivity.objects.filter(
                timestamp__gte=today_start,
                is_idle=False  # Only count active sessions
            ).values('email').distinct().count()

            context.update({
                'total_users': User.objects.count(),
                'active_today': active_today,
                'users': User.objects.all().order_by('email'),
                'selected_user': user_id,
                'selected_date': selected_date,
                'time_from': time_from,
                'time_to': time_to,
                'daily_summary': daily_summary if not user_id else None,
                'user_activities': user_activities,
                'current_time': timezone.localtime().strftime('%Y-%m-%d %H:%M:%S'),
                'current_user': self.request.user.username,
            })

        except Exception as e:
            logger.error(f"Error in dashboard view: {str(e)}")
            context.update({
                'error': str(e),
                'daily_summary': [],
                'user_activities': []
            })

        return context