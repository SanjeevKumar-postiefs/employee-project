# Generated by Django 5.1.1 on 2024-09-25 12:17

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('employee', '0007_ticket'),
    ]

    operations = [
        migrations.AlterField(
            model_name='ticket',
            name='group',
            field=models.CharField(choices=[('Linux', 'Linux'), ('Windows', 'Windows/Azure'), ('AWS', 'Network/AWS'), ('LEVELONE', 'Level One'), ('OCI', 'OCI')], max_length=100),
        ),
    ]
