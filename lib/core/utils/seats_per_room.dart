import 'package:http/http.dart' as http;
import 'dart:convert';
import 'api_endpoints.dart';

import '../../../databases/DBCinemas.dart';

Future<List<Map<String, dynamic>>?> endpoint_api_get_seats_per_room(room_id,session_id) async {
  //This can be improved by placing API endpoints into a constant dart file
  try {
    print("salam in seats per room");
    print(Endpoints.get_seats_per_room);
    final response = await http.get(Uri.parse(
        "${Endpoints.get_seats_per_room}?id=$room_id&session_id=$session_id" ));

    await Future.delayed(Duration(seconds: 2)); // Delay for 2 seconds
    print("malak");
    print("response ;  ${response.statusCode}");

    if (response.statusCode == 200) {
      print("woiiiiiii arwah see response before mapSeat data  = ${response.body} ");
      await Future.delayed(Duration(seconds: 2)); // Delay for 2 seconds
      List<Map<String, dynamic>> ret =
      List<Map<String, dynamic>>.from(jsonDecode(response.body));
      var formatted_ret = mapSeatData(ret);
      await Future.delayed(Duration(seconds: 2)); // Delay for 2 seconds
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
List<Map<String, List<String>>>? mapSeatData(List<Map<String, dynamic>> seatData) {
  Map<int, List<String>> seatMap = {};

  seatData.forEach((seat) {
    final seatReference = seat['Seat_reference'] as String?;
    final seatState = seat['Seat_state'];
    final seatID = seat['Seat_ID'];

    if (seatReference != null) {
      try {
        final rowIndex = int.parse(seatReference.split('#')[1].split('x')[0]);
        print("indexer = $rowIndex");

        final seatRef = '$seatReference*$seatState/$seatID';

        seatMap.putIfAbsent(rowIndex, () => []);
        seatMap[rowIndex]?.add(seatRef);

        if (seatID >= 393) {
          print("ana 3law ma printawnich");
          print(seatRef);
          print(seatMap);
        }
      } catch (e) {
        print("Error parsing rowIndex: $e");
      }
    }
  });

  List<Map<String, List<String>>> result = seatMap.entries.map((entry) {
    return {entry.key.toString(): entry.value};
  }).toList();

  print("from map seat data = $result ");

  return result;
}
