# Generated by Django 5.0 on 2024-01-09 11:57

from django.db import migrations


class Migration(migrations.Migration):
    dependencies = [
        ("backend", "0015_delete_token"),
    ]

    operations = [
        migrations.RemoveField(
            model_name="user",
            name="User_token",
        ),
    ]
