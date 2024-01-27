import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

Future<String> get _localPath async{

  final directory = await getApplicationDocumentsDirectory();
  return directory.path;


}
Future<File> get _localFile async {
  final path = await _localPath;
  return File('$path/credentials.json');
}
Future<void> writeCredentials(user_id,username,email,password,phonenumber) async {
  final file = await _localFile;


  Map<String,dynamic> creds = {
    "id" : user_id,
    "username" : username.toString(),
    "password" : email.toString(),
    "email" : password.toString(),
    "phonenumber" : phonenumber.toString(),
  };
  String jsonmap = jsonEncode(creds);

  // Write the file
  file.writeAsString(jsonmap);
}
Future<Map> readCounter() async {
  try {
    final file = await _localFile;

    // Read the file
    final contents = await file.readAsString();
    Map<String,dynamic> mapObj = jsonDecode(contents);
    print("read counter is called");
    print(mapObj);
    return mapObj;

  } catch (e) {
    // If encountering an error, return 0
    return {};
  }
}