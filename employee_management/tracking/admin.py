from django.contrib import admin
from .models import UserActivity, ActivityReport

@admin.register(UserActivity)
class UserActivityAdmin(admin.ModelAdmin):
    list_display = ('user', 'timestamp', 'is_idle')
    list_filter = ('user', 'is_idle', 'timestamp')
    search_fields = ('user__username',)

@admin.register(ActivityReport)
class ActivityReportAdmin(admin.ModelAdmin):
    list_display = ('user', 'date', 'total_active_time', 'total_idle_time')
    list_filter = ('user', 'date')