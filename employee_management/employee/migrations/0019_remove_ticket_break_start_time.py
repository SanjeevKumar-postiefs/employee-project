# Generated by Django 4.2 on 2024-11-21 06:42

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('employee', '0018_ticket_break_duration_ticket_break_start_time'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='ticket',
            name='break_start_time',
        ),
    ]
