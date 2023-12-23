import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:cinema_ticket_booking_app/core/utils/api_endpoints.dart';
import '../../../databases/DBMovies.dart';

Future<List<Map<String, dynamic>>?> endpoint_api_get_movies() async {
  //This can be improved by placing API endpoints into a constant dart file
  try {
    print("salam Getting Movies");
    final response = await http.get(Uri.parse(
        Endpoints.get_movies));

    print("malak");
    print("response ;  ${response.statusCode}");
    print("wii");
    if (response.statusCode == 200) {
      print("-${response.body}-");
      List<Map<String, dynamic>> ret =
      List<Map<String, dynamic>>.from(jsonDecode(response.body));
      return ret;
    }
  } catch (error) {
    print("Error yes ${error.toString()}");
    return null;
  }
  return null;
}

Future<bool> service_sync_movies() async {
  print("Running Cron Service to get movies");
  List? remote_data2 = await endpoint_api_get_movies();
  print("1111111111111111111111111111111111111");

  if (remote_data2 != null) {
    print("22222222222222222222222222");
    print(remote_data2[0]["Movie_title"]);
    await DBMovies.syncMovies(remote_data2 as List<Map<String, dynamic>>);
    return true;
  }
  else{print("remotedataisnull");}
  return false;
}
