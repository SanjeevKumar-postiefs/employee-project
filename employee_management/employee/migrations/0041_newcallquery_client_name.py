# Generated by Django 4.2 on 2025-01-22 04:10

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('employee', '0040_newcallquery'),
    ]

    operations = [
        migrations.AddField(
            model_name='newcallquery',
            name='client_name',
            field=models.CharField(blank=True, max_length=255, null=True),
        ),
    ]
