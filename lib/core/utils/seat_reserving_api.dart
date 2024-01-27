import 'package:http/http.dart' as http;
import 'dart:convert';
import 'api_endpoints.dart';


Future<int> endpoint_edit_seat(int session_id, int seat_id) async {
  //This can be improved by placing API endpoints into a constant dart file
  try {
    print("inside endpoints_edit_seat");

    final response = await http.post(Uri.parse(
        Endpoints.Edit_Seat),body:
        {
          "seat_id" : seat_id.toString(),
          "session_id"  : session_id.toString()
        }
    );

    print("after posting");

    if (response.statusCode == 200) {
      print("inside reponse.status");
      Map<String, dynamic> jsonResponse = jsonDecode(response.body);

      // Access the returned ID
      int seatInSessionId = jsonResponse['id'];

      print("ret[id] = " + seatInSessionId.toString());
      return seatInSessionId;
    }
  } catch (error) {
    print("Error yes ${error.toString()}");
    return 0;
  }
  return 0;
}
Future<int> endpoint_generate_ticket(user_id,seat_in_session_id) async{
  try {
    print("inside endpoints_add_ticket");

    final response = await http.post(Uri.parse(
        Endpoints.add_ticket),body:
    {
      "seat_in_session_id" : seat_in_session_id.toString(),
      "user_id"  : user_id.toString()
    }
    );

    print("after posting a ticket wiiiiii ");

    if (response.statusCode == 200) {
      Map<String, dynamic> ret =
      Map<String, dynamic>.from(jsonDecode(response.body));
      print("ret = $ret");
      return 1;
    }
  } catch (error) {
    print("Error yes ${error.toString()}");
    return 0;
  }
  return 0;
}



