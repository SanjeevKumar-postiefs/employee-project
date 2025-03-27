from django.urls import path, include

from . import views

app_name = 'tracking'

urlpatterns = [
    path('dashboard/', views.ActivityDashboardView.as_view(), name='activity_dashboard'),
    path('record-activity/', views.record_activity, name='record-activity'),
]