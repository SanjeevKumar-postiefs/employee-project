# Generated by Django 4.2 on 2025-03-14 11:16

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('employee', '0061_activitylog_dailyactivity_total_idle_time'),
    ]

    operations = [
        migrations.DeleteModel(
            name='ActivityLog',
        ),
    ]
