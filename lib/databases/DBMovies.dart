
import 'package:sqflite/sqflite.dart';
import 'DBHelper.dart';

class DBMovies {
  static const tableName = 'MOVIE';
  static const sql_code = '''
  CREATE TABLE IF NOT EXISTS MOVIE (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  remote_id INTEGER,
  Movie_name TEXT,
  Movie_category TEXT,
  Movie_description TEXT,
  Movie_duration TEXT,
  Movie_director TEXT,
  Movie_image TEXT
  );
  ''';
  

  static Future<List<Map<String, dynamic>>> getAllMovies() async {
    try {
      final database = await DBHelper.getDatabase();
      print("cccccccccccc");

      // Use 'await' to get the result of the asynchronous query
      var res = await database.rawQuery('''SELECT *
          from MOVIE
          ''');
          print("abababa");
          print(res);


      return res;
    } catch (error) {
      print('Error in getALLMOVIES: $error');
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

  static Future<bool> syncMovies(
      List<Map<String, dynamic>> remote_data) async {
            print("helllo x");
    List local_data = await getAllMovies();
    
    print("helllo");
    Map index_remote = {};
    List local_ids = [];
    for (Map item in local_data) {
      index_remote[item['remote_id']] = item['id'];
      local_ids.add(item['id']);
    }

    for (Map item in remote_data) {
      int remote_id = item["Movie_ID"];
      String movie_name = item["Movie_title"];
      String Movie_duration= item["Movie_duration"];
      String movieDirector = item["Movie_director"];
      String movie_image = item["Movie_image"];
      String movie_category = item["Movie_category"];
      String Movie_description=item["Movie_description"];
      if (index_remote.containsKey(remote_id)) {
        int local_id = index_remote[remote_id];
        await updateRecord(local_id, {'Movie_name':movie_name,'Movie_image':movie_image,'Movie_director':movieDirector,"Movie_duration":Movie_duration,"Movie_category":movie_category,"Movie_description":Movie_description});
        local_ids.remove(local_id);
      } else {
        await insertRecord({'remote_id' : remote_id,'Movie_name':movie_name,'Movie_image':movie_image,'Movie_director':movieDirector,"Movie_duration":Movie_duration,"Movie_category":movie_category ,"Movie_description":Movie_description});
      }
    }
    var res = await getAllMovies();
    for(var row in res) {
      print("After synching" + row['Movie_name']);
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
