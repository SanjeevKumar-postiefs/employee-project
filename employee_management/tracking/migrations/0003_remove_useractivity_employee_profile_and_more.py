# Generated by Django 4.2 on 2025-03-04 11:42

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('tracking', '0002_alter_useractivity_options_and_more'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='useractivity',
            name='employee_profile',
        ),
        migrations.RemoveField(
            model_name='useractivity',
            name='skill_group',
        ),
    ]
