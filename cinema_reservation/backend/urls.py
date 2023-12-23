from django.urls import path
from .views import cinema_get, sessions_get, room_get, movie_get, register_user, login_user

urlpatterns = [
    path('cinema/get/', cinema_get, name='cinema_get'),
    path('sessions/get/', sessions_get, name='sessions_get'),
    path('room/get/', room_get, name='room_get'),
    path('movie/get/', movie_get, name='movie_get'),
    path('register/',register_user, name="register" ),
    path('login/',login_user ,name="login"),
]
