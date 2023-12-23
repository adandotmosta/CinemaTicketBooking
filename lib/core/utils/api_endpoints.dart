import 'package:cinema_ticket_booking_app/core/constants/constants.dart';


class Endpoints{
  static const String get_all_cinemas = "http://${Constants.hostname}/Cinema_Endpoints/?action=cinema.get";
  //static const String get_all_cinemas = "http://${Constants.hostname}:8000/api/cinema/get";
  //static const String get_sessions_per_cinema = "http://${Constants.hostname}/Cinema_Endpoints/?action=sessions.get";
  static const String get_sessions_per_cinema = "http://${Constants.djangoHost}/api/sessions/get/";

  static const String get_seats_per_room = "http://${Constants.hostname}/Cinema_Endpoints/?action=room.get";
  //static const String get_movies = "http://${Constants.hostname}/Cinema_Endpoints/?action=movie.get";
   static const String get_movies = "http://${Constants.djangoHost}/api/movie/get";
   static const String signup = "http://${Constants.djangoHost}/api/register/";
 // static const String signup = "http://${Constants.hostname}/Cinema_Endpoints/signup.php";
 // static const String login = "http://${Constants.hostname}/Cinema_Endpoints/login.php";
  static const String login = "http://${Constants.djangoHost}/api/login/";
}