from rest_framework import serializers
from .models import UserActivity, ActivityReport

class UserActivitySerializer(serializers.ModelSerializer):
    class Meta:
        model = UserActivity
        fields = '__all__'
        read_only_fields = ('user',)

class ActivityReportSerializer(serializers.ModelSerializer):
    class Meta:
        model = ActivityReport
        fields = '__all__'