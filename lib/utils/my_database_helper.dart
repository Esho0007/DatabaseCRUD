import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/user.dart';

class DatabaseHelper {
  static const dbname = "myDatabase.db";
  static const dbVersion = 1;
  static const tableName = "myTable";
  static const columnId = "id";
  static const columnName = "name";
  static const columnPassword = "password";


  //singleton class
  DatabaseHelper._();
  static final DatabaseHelper instance = DatabaseHelper._();

  static Database? _database;
  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    }
    _database = await initiateDatabase();
    return _database;
  }

  initiateDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, dbname);
    return await openDatabase(path, version: dbVersion, onCreate: onCreate);
  }

  Future onCreate(Database db, int dbversion) async {
    return await db.execute('''
         CREATE TABLE $tableName ($columnId INTEGER PRIMARY KEY,
         $columnName TEXT NOT NULL, $columnPassword TEXT NOT NULL)
      ''');
  }


  Future<int> saveUser(User user) async {
    Database? db = await instance.database;
    return await db!.insert(tableName, user.toMap());

}

  Future<List<Map<String, dynamic>>> queryAll() async {
    Database? db = await instance.database;
    return await db!.query(tableName);
  }

  Future<int> update(Map<String, dynamic> row) async {
    Database? db = await instance.database;
    int id = row[columnId];
    return await db!
        .update(tableName, row, where: '$columnId=?', whereArgs: [id]);
  }

  Future<int> delete(int id) async {
    Database? db = await instance.database;
    return await db!.delete(tableName, where: '$columnId=?', whereArgs: [id]);
  }
}