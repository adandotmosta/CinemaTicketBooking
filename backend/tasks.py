from push_notifications.models import APNSDevice, GCMDevice
from models import Ticket
from celery import shared_task
from datetime import timedelta
from django.utils import timezone
from .models import Ticket, Session, User


def check_ticket_validity() : 
    tickets = Ticket.objects.get(Ticket_barcode="abdenour")
    tickets.Ticket_barcode = "belarbi"
    tickets.save()

@shared_task
def send_session_reminder_notifications():
    upcoming_sessions = Session.objects.filter(
        session_time__lte=timezone.now() + timedelta(hours=1),
        session_time__gte=timezone.now()
    )

    for session in upcoming_sessions:
        ticket_users = User.objects.filter(ticket__session=session)

        for user in ticket_users:
            # Replace 'device_type' and 'registration_id' with the actual fields in your User model
            device_type = user.device_type
            registration_id = user.registration_id

            if device_type == 'android':  # Assuming you have a field 'device_type' for Android
                device = GCMDevice.objects.filter(registration_id=registration_id).first()
            elif device_type == 'ios':  # Assuming you have a field 'device_type' for iOS
                device = APNSDevice.objects.filter(registration_id=registration_id).first()
            else:
                continue  # Skip users with unknown device types

            if device:
                device.send_message(
                    message=f"Don't forget about the upcoming session at {session.session_time}.",
                    extra={
                        'custom_data': 'any_custom_data_you_want_to_send',
                    },
                )