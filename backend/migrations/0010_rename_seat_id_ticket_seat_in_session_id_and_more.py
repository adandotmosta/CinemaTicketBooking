from django.db import migrations, models



def assign_unique_seat_in_session_ids(apps, schema_editor):
    Seats = apps.get_model("backend", "seat")
    Seat_in_session = apps.get_model("backend", "Seat_in_session")
    i= 1
    # Assign unique Seat_in_session_ID values to existing rows
    for seat in Seats.objects.all():
        seat_in_session = Seat_in_session.objects.create(
            Seat_ID = seat.Seat_ID,
            Session_ID = 13,
            Seat_State=0
        )
        seat_in_session.save()

class Migration(migrations.Migration):
    dependencies = [
        ("backend", "0009_remove_ticket_session_id_alter_ticket_seat_id"),
    ]

    operations = [
        migrations.RenameField(
            model_name="ticket",
            old_name="Seat_ID",
            new_name="Seat_in_session_ID",
        ),
        migrations.RemoveField(
            model_name="seat_in_session",
            name="id",
        ),
        migrations.AddField(
            model_name="seat_in_session",
            name="Seat_in_session_ID",
            field=models.AutoField( primary_key=True, serialize=False),
        ),
        migrations.RunPython(assign_unique_seat_in_session_ids),
    ]
