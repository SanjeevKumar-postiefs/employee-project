# Generated by Django 4.2 on 2024-10-03 05:12

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('employee', '0008_alter_ticket_group'),
    ]

    operations = [
        migrations.AddField(
            model_name='employeeprofile',
            name='status',
            field=models.CharField(choices=[('active', 'Active'), ('on_break', 'On Break'), ('offline', 'Offline')], default='offline', max_length=20),
        ),
    ]
