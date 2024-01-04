import 'package:cinema_ticket_booking_app/core/constants/constants.dart';


class Endpoints{
  static const String get_all_cinemas = "http://${Constants.hostname}/Cinema_Endpoints/?action=cinema.get";
  //static const String get_all_cinemas = "http://${Constants.hostname}:8000/api/cinema/get";
  //static const String get_sessions_per_cinema = "http://${Constants.hostname}/Cinema_Endpoints/?action=sessions.get";
  static const String get_sessions_per_cinema = "http://${Constants.djangoHost}/api/sessions/get/";

  //static const String get_seats_per_room = "http://${Constants.hostname}/Cinema_Endpoints/?action=room.get";
  static const String get_seats_per_room = "http://${Constants.djangoHost}/api/seats_per_room/get/";
  //static const String get_movies = "http://${Constants.hostname}/Cinema_Endpoints/?action=movie.get";
  static const String get_room = "http://${Constants.djangoHost}/api/room/get/";
   static const String get_movies = "http://${Constants.djangoHost}/api/movie/get/";
  static const String get_session = "http://${Constants.djangoHost}/api/session/get";
  static const String get_casts = "http://${Constants.djangoHost}/api/cast/get";
  static const String get_images = "http://${Constants.djangoHost}/api/images/get";
   static const String signup = "http://${Constants.djangoHost}/api/register/";
   static const String get_tickets = "http://${Constants.djangoHost}/api/ticket/get/";
 // static const String signup = "http://${Constants.hostname}/Cinema_Endpoints/signup.php";
 // static const String login = "http://${Constants.hostname}/Cinema_Endpoints/login.php";
  static const String login = "http://${Constants.djangoHost}/api/login/";

  static const String logout = "http://${Constants.djangoHost}/api/logout/";
  static String getFilteredSessions(int movieId) {
    return "http://${Constants.djangoHost}/api/session/get/$movieId/";
  }



  static const String Edit_Seat = "http://${Constants.djangoHost}/api/seat/edit/";

  static const String add_ticket = "http://${Constants.djangoHost}/api/ticket/add/";

  static const String edit_user = "http://${Constants.djangoHost}/api/user/edit/";

}