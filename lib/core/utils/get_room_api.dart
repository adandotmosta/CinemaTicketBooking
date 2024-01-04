import 'package:http/http.dart' as http;
import 'dart:convert';
import 'api_endpoints.dart';

import '../../../databases/DBCinemas.dart';

Future<Map<String, dynamic>?> endpoint_api_get_room(int room_id) async {
  //This can be improved by placing API endpoints into a constant dart file
  try {
    print("salam im in get room");
    print(Endpoints.get_room);
    final response = await http.get(Uri.parse(
        Endpoints.get_room + "?id=$room_id" ));
    print("malak");
    print("response ;  ${response.statusCode}");
    print("wii");
    if (response.statusCode == 200) {
      Map<String, dynamic> ret =
      Map<String, dynamic>.from(jsonDecode(response.body)[0]);
      print("ret = $ret");
      return ret;
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

