from django.contrib import admin
from .models import *
# Register your models here.
admin.site.register(Movie)
admin.site.register(Cinema)
admin.site.register(Seat)
admin.site.register(Ticket)
admin.site.register(User)
admin.site.register(Session)
admin.site.register(CastPath)
admin.site.register(ImagesPath)
admin.site.register(Room)
admin.site.register(Seat_in_session)
