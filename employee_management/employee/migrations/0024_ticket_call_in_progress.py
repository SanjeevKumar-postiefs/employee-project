# Generated by Django 4.2 on 2024-12-10 08:46

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('employee', '0023_ticket_call_duration_ticket_call_end_time_and_more'),
    ]

    operations = [
        migrations.AddField(
            model_name='ticket',
            name='call_in_progress',
            field=models.BooleanField(default=False),
        ),
    ]