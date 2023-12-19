import 'package:cinema_ticket_booking_app/core/constants/constants.dart';


class Endpoints{
  static const String get_all_cinemas = "http://${Constants.hostname}/Cinema_Endpoints/?action=cinema.get";
  static const String get_sessions_per_cinema = "http://${Constants.hostname}/Cinema_Endpoints/?action=sessions.get";
  static const String get_seats_per_room = "http://${Constants.hostname}/Cinema_Endpoints/?action=room.get";
  static const String get_movies = "http://${Constants.hostname}/Cinema_Endpoints/?action=movie.get";
}