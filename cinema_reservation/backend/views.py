from django.http import JsonResponse
from django.db.models import Q
from .models import *
from datetime import datetime
from rest_framework.decorators import api_view, permission_classes
from django.core.serializers.json import DjangoJSONEncoder
from django.db.models import F
from django.views.decorators.csrf import csrf_exempt
import json
from django.contrib.auth import authenticate, login
from django.contrib.auth.hashers import check_password

def cinema_get(request):
    items = Cinema.objects.all().values()
    return JsonResponse(list(items), safe=False)

def sessions_get(request):
    cinema_id = request.GET.get('id')
    current_time = datetime.now().strftime('%Y-%m-%d %H:%M:%S')

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




@csrf_exempt
def register_user(request):
    if request.method == 'POST':
        try:
            print("9bal ma lawdi")
            data = request.POST
         #   print(example)
            username = data.get('username')
            email = data['email']
            password = data['password']
            phone = data['phone']

            # Hash the password using Django's make_password
            hashed_password = password

            # Perform the query
            user = User(User_name=username, User_email=email, User_password=hashed_password, User_phone_number=phone)
            user.save()

            # Registration successful
            response = {'success': True, 'message': 'Registration successful'}
            return JsonResponse(response)

        except Exception as e:
            print(f"registration failed , print {str(e)}")
            # Registration failed
            response = {'success': False, 'message': f'Registration failed: {str(e)}'}
            return JsonResponse(response)

    else:
        # Parameters not provided
        response = {'success': False, 'message': 'All fields are required'}
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

