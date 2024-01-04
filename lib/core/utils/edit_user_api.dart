import 'package:http/http.dart' as http;
import 'dart:convert';
import 'api_endpoints.dart';


Future<Map<String, dynamic>?> endpoint_api_edit_user(int user_id,String username,String email, String password, String phonenumber) async {
  //This can be improved by placing API endpoints into a constant dart file
  try {
    print("salam im in get room");
    print(Endpoints.edit_user
    );
    final response = await http.post(Uri.parse(
        Endpoints.edit_user),body:
    {
      "user_id" : user_id.toString(),
      "username"  : username.toString(),
      "password" : password.toString(),
      "phonenumber" : phonenumber.toString(),
      "email" : email.toString(),
    }
    );
    print("response ;  ${response.statusCode}");
    if (response.statusCode == 200) {

      return jsonDecode(response.body);
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

