from backend.models import *

session_id = 7

# Assuming you already have a Session with the given session_id
session = Session.objects.get(Session_ID=session_id)

# Assuming seat_id range is 94 to 121
for seat_id in range(94, 122):
    seat = Seat.objects.get(Seat_ID=seat_id)
    seat_in_session = Seat_in_session.objects.create(
        Seat_ID=seat,
        Session_ID=session,
        Seat_State=0  # Assuming seat_state is always 0
    )
    seat_in_session.save()