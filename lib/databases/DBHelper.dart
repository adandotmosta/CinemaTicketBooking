import 'dart:async';

import 'package:cinema_ticket_booking_app/databases/DBMovies.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:cinema_ticket_booking_app/databases/DBCinemas.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static const _database_name = "Local_Cinema_DB";
  static const _database_version =6;
  static var database;

  static Future getDatabase() async {
    if (database != null) {
      print("database in not null");
      return database;
    }
    List sql_create_code = [
      DBCinemas.sql_code,
    DBMovies.sql_code,
    ];
    database = openDatabase(
      join(await getDatabasesPath(), _database_name),
      onCreate: (database, version) {
        for (var sql_code in sql_create_code) {try {database.execute(sql_code);print(sql_code);}catch(e){print(e);}}
      },
      version: _database_version,
      onUpgrade: (database, oldVersion, newVersion) {
        print(">>>>>>>>>>>>>$oldVersion vs $newVersion");
        if (oldVersion != newVersion) {
          database.execute('DROP TABLE IF EXISTS Cinema');
        database.execute('DROP TABLE IF EXISTS MOVIE');
          print("droping cinema");
          for (var sql_code in sql_create_code) {
            database.execute(sql_code);
            print("creating table cinema");
          }
        }
      },
    );
    return database;
  }
}
