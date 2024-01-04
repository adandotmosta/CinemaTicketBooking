from django.urls import path
from .views import cinema_get, sessions_get, room_get, movie_get, register_user, login_user, images_get, get_filtered_sessions, cast_get

urlpatterns = [
    path('cinema/get/', cinema_get, name='cinema_get'),
    path('sessions/get/', sessions_get, name='sessions_get'),
    path('room/get/', room_get, name='room_get'),
    path('movie/get/', movie_get, name='movie_get'),
    path('images/get/<int:movie_id>/', images_get, name='images_get'),
    path('session/get/<int:movie_id>/', get_filtered_sessions, name='session_get'),
    path('cast/get/<int:movie_id>/', cast_get, name='cast_get'),
    path('register/',register_user, name="register" ),
    path('login/',login_user ,name="login"),
]