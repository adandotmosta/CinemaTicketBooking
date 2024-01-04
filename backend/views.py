from django.http import JsonResponse
from django.db.models import Q
from .models import *
from datetime import datetime
from rest_framework.decorators import api_view, permission_classes
from django.core.serializers.json import DjangoJSONEncoder
from django.db.models import F
from django.views.decorators.csrf import csrf_exempt
import json
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.hashers import check_password
from django.core.validators import validate_email
from django.core.exceptions import ValidationError
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from django.utils import timezone
from rest_framework.authtoken.models import Token


def cinema_get(request):
    items = Cinema.objects.all().values()
    return JsonResponse(list(items), safe=False)

def sessions_get(request):
    cinema_id = request.GET.get('id')
    current_time = timezone.now()

    items = Session.objects.filter(
        Session_room__Cinema_ID=cinema_id,
        Session_time__gte=current_time
    ).values(
        'Session_ID',
        'Session_version',
        'Session_time',
        Movie_title=F('Session_movie__Movie_title'),
    )
    items_list = list(items)
    for item in items_list:
        item['Session_time'] = item['Session_time'].strftime('%Y-%m-%d %H:%M:%S')
    return JsonResponse(items_list, safe=False)

def room_get(request):
    room_id = 1  # You may need to adjust this based on your requirements
    items = Seat.objects.filter(room__id=room_id).values()
    return JsonResponse(list(items), safe=False, encoder=DjangoJSONEncoder)

def movie_get(request):
    items = Movie.objects.all().values()
    return JsonResponse(list(items), safe=False)

def get_filtered_sessions(request, movie_id):
    try:
        current_time = timezone.now()

        # Build the base queryset with filtering on Session_time
        base_query = Session.objects.filter(Session_time__gte=current_time)

        # Apply additional filter if movie_id is provided
        if movie_id is not None:
            base_query = base_query.filter(Session_movie__Movie_ID=movie_id)

        # Retrieve the desired fields with formatted date and time
        result = (
            base_query
            .values(
                'Session_room__Room_number',  # Room number
                'Session_movie__Movie_title',  # Movie name
                'Session_movie__Image_path',
                'Session_ID',
                'Session_version',
                'Session_price',
                'Session_room_id',  # Add the room ID if needed
                'Session_movie_id',  # Add the movie ID if needed
                'Session_time',
            )
        )
        # Format date and time for each session
        formatted_sessions = []
        for session in result:
            session_time = session['Session_time']  # Assuming 'Session_time' is in the result
            formatted_date = session_time.strftime('%Y-%m-%d')
            formatted_time = session_time.strftime('%H:%M:%S')
            session['formatted_date'] = formatted_date
            session['formatted_time'] = formatted_time
            formatted_sessions.append(session)

        return JsonResponse({'sessions': formatted_sessions})
        
    except Exception as e:
        return JsonResponse({'error': str(e)})


def cast_get(request, movie_id):
    casts = CastPath.objects.filter(Movie_id=movie_id).values()
    return JsonResponse(list(casts), safe=False)

def images_get(request, movie_id):
    images = ImagesPath.objects.filter(Movie_id=movie_id).values()
    return JsonResponse(list(images), safe=False)




@csrf_exempt
def register_user(request):
    if request.method == 'POST':
        try:
            data = request.POST
            username = data.get('username')
            email = data.get('email')
            password = data.get('password')
            phone = data.get('phone')

            # Check for empty fields
            if not all([username, email, password, phone]):
                response = {'success': False, 'message': 'All fields are required'}
                return JsonResponse(response)

            # Validate email format
            try:
                validate_email(email)
            except ValidationError as e:
                response = {'success': False, 'message': f'Invalid email format: {str(e)}'}
                return JsonResponse(response)

            # Validate phone number (customize based on your requirements)
            if not phone.isdigit() or len(phone) != 10:
                response = {'success': False, 'message': 'Invalid phone number format'}
                return JsonResponse(response)

            # Hash the password using Django's make_password
            hashed_password = password

            # Perform the query
            user = User(User_name=username, User_email=email, User_password=hashed_password, User_phone_number=phone)
            user.save()

            # Registration successful
            response = {'success': True, 'message': 'Registration successful'}
            return JsonResponse(response)

        except Exception as e:
            # Registration failed
            response = {'success': False, 'message': f'Registration failed: {str(e)}'}
            return JsonResponse(response)

    else:
        # Invalid request method or missing parameters
        response = {'success': False, 'message': 'Invalid request or missing parameters'}
        return JsonResponse(response)



@csrf_exempt
def login_user(request):
    if request.method == 'POST':
        try:
            data = request.POST
            email = data.get('email')
            password = data.get('password')

            # Check if email and password are provided
            if not email or not password:
                response = {'success': False, 'message': 'Email and password are required'}
                return JsonResponse(response)

            # Query the user by email
            try:
                user = User.objects.get(User_email=email)
            except User.DoesNotExist:
                # User not found
                response = {'success': False, 'message': 'User not found'}
                return JsonResponse(response)

            # Check the password
            if password == user.User_password:
                # Password is correct
                response = {'success': True, 'message': 'Login successful'}
                return JsonResponse(response)
            else:
                # Incorrect password
                response = {'success': False, 'message': 'Incorrect password'}
                return JsonResponse(response)

        except Exception as e:
            # Login failed
            response = {'success': False, 'message': f'Login failed: {str(e)}'}
            return JsonResponse(response)

    else:
        # Invalid request method
        response = {'success': False, 'message': 'Invalid request method'}
        return JsonResponse(response)

    
@csrf_exempt    
def logout_user(request):
    if request.method == 'POST':
        try:
            # Log the user out
            logout(request)
            
            response = {'success': True, 'message': 'Logout successful'}
            return JsonResponse(response)

        except Exception as e:
            # Logout failed
            response = {'success': False, 'message': f'Logout failed: {str(e)}'}
            return JsonResponse(response)

    else:
        # Invalid request method
        response = {'success': False, 'message': 'Invalid request method'}
        return JsonResponse(response)
    
