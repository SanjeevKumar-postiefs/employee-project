# Generated by Django 4.2 on 2024-11-14 09:08

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('employee', '0009_session'),
    ]

    operations = [
        migrations.AddField(
            model_name='dailyactivity',
            name='active_sessions',
            field=models.JSONField(blank=True, default=list),
        ),
        migrations.DeleteModel(
            name='Session',
        ),
    ]
