import 'package:http/http.dart' as http;
import 'dart:convert';
import 'api_endpoints.dart';

import '../../../databases/DBCinemas.dart';

Future<List<Map<String, dynamic>>?> endpoint_api_get_room() async {
  //This can be improved by placing API endpoints into a constant dart file
  try {
    print("salam");
    print(Endpoints.get_seats_per_room);
    final response = await http.get(Uri.parse(
        Endpoints.get_seats_per_room ));
    print("malak");
    print("response ;  ${response.statusCode}");
    print("wii");
    if (response.statusCode == 200) {
      List<Map<String, dynamic>> ret =
      List<Map<String, dynamic>>.from(jsonDecode(response.body));
      var formatted_ret = mapSeatData(ret);
      print(formatted_ret);
      return formatted_ret;
    }
  } catch (error) {
    print("Error yes ${error.toString()}");
    return null;
  }
  return null;
}

/*Future<bool> service_sync_cinemas() async {
  print("Running Cron Service to get Categories");
  List? remote_data = await endpoint_api_get_categories();
  print("1111111111111111111111111111111111111");

  if (remote_data != null) {
    print("22222222222222222222222222");
    print(remote_data[0]["Cinema_name"]);
    await DBCinemas.syncCinemas(remote_data as List<Map<String, dynamic>>);
    return true;
  }
  return false;
}*/
List<Map<String, List<String>>> mapSeatData(List<Map<String, dynamic>> seatData) {
  Map<int, List<String>> seatMap = {};

  seatData.forEach((seat) {
    int rowIndex = int.parse(seat['Seat_reference'].split('#')[1].split('x')[0]);
    String seatRef = seat['Seat_reference'];

    seatMap.putIfAbsent(rowIndex, () => []);
    seatMap[rowIndex]?.add(seatRef);
  });

  List<Map<String, List<String>>> result = seatMap.entries.map((entry) {
    return {entry.key.toString(): entry.value};
  }).toList();

  return result;
}