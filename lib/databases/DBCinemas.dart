
import 'package:sqflite/sqflite.dart';
import 'DBHelper.dart';

class DBCinemas {
  static const tableName = 'Cinema';
  static const sql_code = '''
  CREATE TABLE IF NOT EXISTS Cinema (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  remote_id INTEGER,
  Cinema_name TEXT,
  Cinema_location TEXT,
  Cinema_description TEXT,
  Cinema_image TEXT,
  Cinema_closing Text
  );
  ''';

  static Future<List<Map<String, dynamic>>> getAllCinemas() async {
    try {
      final database = await DBHelper.getDatabase();
      print("cccccccccccc");

      // Use 'await' to get the result of the asynchronous query
      var res = await database.rawQuery('''SELECT *
          from ${tableName}
          ''');


      return res;
    } catch (error) {
      print('Error in getAllCinemas: $error');
      // Handle the error or rethrow it if needed
      throw error;
    }
  }


/*  static Future<int> getCategoryByName(String name) async {
    final database = await DBHelper.getDatabase();

    List<Map> res = await database.rawQuery('''SELECT 
            id  
          from ${tableName}
          where name='$name'
          ''');
    return res[0]['id'] ?? 0;
  }*/

  static Future<int> getAllCount() async {
    final database = await DBHelper.getDatabase();


    List<Map> res = await database.rawQuery('''SELECT 
            count(id) as cc
          from ${tableName}
          order by name ASC
          ''');
    return res[0]['cc'] ?? 0;
  }

  static Future<bool> syncCinemas(
      List<Map<String, dynamic>> remote_data) async {
    List local_data = await getAllCinemas();
    Map index_remote = {};
    List local_ids = [];
    for (Map item in local_data) {
      index_remote[item['remote_id']] = item['id'];
      local_ids.add(item['id']);
    }

    for (Map item in remote_data) {
      int remote_id = item["Cinema_ID"];
      String cinema_name = item["Cinema_name"];
      String cinema_location = item["Cinema_location"];
      String cinema_description = item["Cinema_description"];
      String cinema_image = item["Cinema_image"];
      String cinema_closing = item["Cinema_closing"];

      if (index_remote.containsKey(remote_id)) {
        int local_id = index_remote[remote_id];
        await updateRecord(local_id, {'Cinema_name':cinema_name, 'Cinema_location' : cinema_location,
          'Cinema_description' : cinema_description, 'Cinema_image' : cinema_image, 'Cinema_closing' : cinema_closing });
        local_ids.remove(local_id);
      } else {
        await insertRecord({'remote_id' : remote_id,'Cinema_name':cinema_name, 'Cinema_location' : cinema_location,
          'Cinema_description' : cinema_description, 'Cinema_image' : cinema_image, 'Cinema_closing' : cinema_closing });
      }
    }
    var res = await getAllCinemas();
    for(var row in res) {
      print("After synching" + row['Cinema_name']);
    }
    //Remote Local Categories...
    //There is a RISK ? in case items pending with old data?
    for (int local_id in local_ids) await deleteRecord(local_id);
    return true;
  }

  static Future<bool> updateRecord(int id, Map<String, dynamic> data) async {
    final database = await DBHelper.getDatabase();
    database.update(tableName, data, where: "id=?", whereArgs: [id]);
    return true;
  }

  static Future<int> insertRecord(Map<String, dynamic> data) async {
    final database = await DBHelper.getDatabase();
    return await database.insert(tableName, data,
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<bool> deleteRecord(int id) async {
    final database = await DBHelper.getDatabase();
    database.rawQuery("""delete from  ${tableName}  where id=?""", [id]);
    return true;
  }
}
