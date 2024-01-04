from django.urls import path
from .views import *

urlpatterns = [
    #API/
    path('cinema/get/', cinema_get, name='cinema_get'),
    path('sessions/get/', sessions_get, name='sessions_get'),
    path('seats_per_room/get/', seats_room_get, name='seats_room_get'),
    path('movie/get/', movie_get, name='movie_get'),
    path('room/get/', room_get,name="room_get"),
    path('register/',register_user, name="register" ),
    path('login/',login_user ,name="login"),
    path('seat/edit/',edit_seat, name="edit_seat"),
    path('ticket/add/',add_ticket,name="add_ticket"),
    path('ticket/get/',get_tickets,name="getTickets"),
    path('dashboard/',dashboard,name='dashboard'),
    path('rtler/', rtler ,name='rtler'),
    path("user/edit/", edit_user, name="edit_user")





    #''/
]
