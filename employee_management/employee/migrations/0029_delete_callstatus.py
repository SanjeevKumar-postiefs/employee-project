# Generated by Django 4.2 on 2024-12-20 06:49

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('employee', '0028_callstatus'),
    ]

    operations = [
        migrations.DeleteModel(
            name='CallStatus',
        ),
    ]