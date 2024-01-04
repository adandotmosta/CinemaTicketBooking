# Generated by Django 5.0 on 2024-01-04 17:45

import django.db.models.deletion
from django.db import migrations, models


class Migration(migrations.Migration):
    dependencies = [
        ("backend", "0010_rename_seat_id_ticket_seat_in_session_id_and_more"),
    ]

    operations = [
        migrations.AddField(
            model_name="movie",
            name="Image_path",
            field=models.CharField(blank=True, max_length=255, null=True),
        ),
        migrations.CreateModel(
            name="Token",
            fields=[
                (
                    "id",
                    models.BigAutoField(
                        auto_created=True,
                        primary_key=True,
                        serialize=False,
                        verbose_name="ID",
                    ),
                ),
                ("key", models.CharField(max_length=40)),
                (
                    "user",
                    models.OneToOneField(
                        on_delete=django.db.models.deletion.CASCADE, to="backend.user"
                    ),
                ),
            ],
        ),
    ]
