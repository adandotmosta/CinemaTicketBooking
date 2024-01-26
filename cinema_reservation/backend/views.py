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
from django.shortcuts import render
from django.http import HttpResponse
from django.utils import timezone

def dashboard(request):
    return render(request,'pages/dashboard.html')


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
        'Session_room',
        Movie_title=F('Session_movie__Movie_title'),

    )
    items_list = list(items)
    for item in items_list:
        item['Session_time'] = item['Session_time'].strftime('%Y-%m-%d %H:%M:%S')
    return JsonResponse(items_list, safe=False)

def seats_room_get(request):
    room_id = request.GET.get('id')
    session_id = request.GET.get('session_id')

    # Assuming you want to retrieve seats for a specific session
    seats_in_session = Seat_in_session.objects.filter(Session_ID=session_id).select_related('Seat_ID')

    
    items = []
    for seat_in_session in seats_in_session:
        seat = seat_in_session.Seat_ID
        item = {
            "Seat_ID": seat.Seat_ID,
            "Seat_reference": seat.Seat_reference,
            "Room_ID_id": seat.Room_ID_id,
            "Seat_state": seat_in_session.Seat_State,
        }
        items.append(item)
    print(items)

    return JsonResponse(items, safe=False)

def movie_get(request):
    items = Movie.objects.all().values()
    return JsonResponse(list(items), safe=False)

def room_get(request):
    id = request.GET.get("id")
    item = Room.objects.filter(Room_ID=id).values()
    return JsonResponse(list(item),safe=False)



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
                creds = {
                    "id" : user.User_ID,
                    "username" : user.User_name,
                    "email" : user.User_email,
                    "password" : user.User_password,
                    "phoneNumber" : user.User_phone_number,
                }
                response = {'success': True, 'message': 'Login successful','credentials' :creds }
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

def rtler(request):
    return render(request,'pages/rtl.html')


@csrf_exempt
def edit_seat(request):
    if request.method=='POST':
        data = request.POST
        seat_id = int(data.get("seat_id"))
        session_id = int(data.get("session_id"))
        seat_in_session = Seat_in_session.objects.get(Seat_ID=seat_id,Session_ID=session_id)
        if(seat_in_session.Seat_State!=2) : 
            seat_in_session.Seat_State = 2
        else : 
            response = {'success': False, 'message': 'Taken'}
            return JsonResponse(response)

            
        seat_in_session.save()
        response = {'success': True, 'message': 'Edit successful', 'id' : seat_in_session.Seat_in_session_ID }
        return JsonResponse(response)
    else : 
        response = {'success': False, 'message': 'Invalid request method'}
        return JsonResponse(response)



@csrf_exempt
def add_ticket(request):
    if request.method == "POST":
        data = request.POST
        seat_in_session_id = data.get("seat_in_session_id")
        user_id = data.get("user_id")
        barcode = "example"

        # Fetch the Seat_in_session and User instances
        seat_in_session = Seat_in_session.objects.get(Seat_in_session_ID=seat_in_session_id)
        user = User.objects.get(User_ID=user_id)

        # Create a new Ticket instance
        new_ticket = Ticket.objects.create(
            Seat_in_session_ID=seat_in_session,
            User_ID=user,
            Ticket_time=timezone.now(),  # Set to the current date and time
            Ticket_barcode=barcode
        )

        # Optionally, you can save the new_ticket instance if needed
        new_ticket.save()



        response = {'success': True, 'message': 'Add Ticket successful' }
        return JsonResponse(response)

    # Handle cases where the request method is not POST
    response = {'success': False, 'message': 'Invalid request method'}
    return JsonResponse(response)

@csrf_exempt
def get_tickets(request):
    user_id = request.GET.get("user_id")
 #   user_id = request.GET["user_id"]
    # Fetch ticket information with details from multiple tables
    tickets_query = Ticket.objects.select_related(
        'seat_in_session_ID__seat_ID__room_ID__Cinema_ID',
        'seat_in_session_ID__session_ID__Session_movie',
        'User_ID'
    ).values(
        'Seat_in_session_ID__Session_ID__Session_movie__Movie_title',
        'Seat_in_session_ID__Seat_ID__Seat_reference',
        'Seat_in_session_ID__Session_ID__Session_room__Cinema_ID__Cinema_location',
        'Seat_in_session_ID__Session_ID__Session_room__Cinema_ID__Cinema_name',
        'Seat_in_session_ID__Session_ID__Session_time',
        'Ticket_time',
        'Ticket_barcode',
        'User_ID__User_name',
    ).filter(User_ID=user_id).order_by("-Ticket_time")
    print(tickets_query.query)

    # Check if there are rows in the result set
    if tickets_query.exists():
        # Convert the result to a list of dictionaries
        tickets = list(tickets_query)

        # Modify the list to match the desired structure
        for ticket in tickets:
            ticket['film'] = ticket.pop('Seat_in_session_ID__Session_ID__Session_movie__Movie_title')


            ticket["ticket_time"]   = ticket.pop('Ticket_time')
            ticket['seat'] = ticket.pop('Seat_in_session_ID__Seat_ID__Seat_reference')
            ticket['location'] = ticket.pop('Seat_in_session_ID__Session_ID__Session_room__Cinema_ID__Cinema_location')
            ticket['cinema'] = ticket.pop('Seat_in_session_ID__Session_ID__Session_room__Cinema_ID__Cinema_name')
            ticket['session_time'] = ticket.pop('Seat_in_session_ID__Session_ID__Session_time')
            ticket['Ticket_barcode'] = ticket.pop('Ticket_barcode')
            ticket["payementStatus"] = ""
            ticket["orderNumber"] = ""

        # Output the JSON response
        return JsonResponse(tickets, safe=False)
    else:
        # No tickets found
        return JsonResponse({'message': 'No tickets found'})
    
@csrf_exempt
def edit_user(request):
    if request.method == "POST":
        data = request.POST
        user_id = data["user_id"]
        user = User.objects.get(User_ID=user_id)
        user.User_name = data["username"]
        user.User_email = data["email"]
        user.User_password = data["password"]
        user.User_phone_number = data["phonenumber"]
        user.save()
        return JsonResponse({ "success" : True , "message" : "Edit User Succesfully"})
    else : 
                return JsonResponse({ "success" : False , "message" : "invalid request method"})



def cast_get(request, movie_id):
    casts = CastPath.objects.filter(Movie_id=movie_id).values()
    return JsonResponse(list(casts), safe=False)

def images_get(request, movie_id):
    images = ImagesPath.objects.filter(Movie_id=movie_id).values()
    return JsonResponse(list(images), safe=False)

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