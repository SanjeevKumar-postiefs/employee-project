# Generated by Django 4.2 on 2024-11-14 09:24

import datetime
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('employee', '0011_remove_dailyactivity_active_sessions_and_more'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='dailyactivity',
            name='session_times',
        ),
        migrations.AddField(
            model_name='dailyactivity',
            name='accumulated_work_time',
            field=models.DurationField(default=datetime.timedelta),
        ),
    ]
