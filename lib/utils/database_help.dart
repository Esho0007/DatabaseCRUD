// import 'dart:async';
// import 'dart:io';
// import 'package:database_intro/models/user.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:path/path.dart';
//
// class DatabaseHelper  {
//   static final DatabaseHelper _instance = DatabaseHelper.internal();
//
//   factory DatabaseHelper() => _instance;
//
//   final String tableUser ="userTable";
//   final String columbId = "id";
//   final String columbUsername = "username";
//   final String columbPassword = "password";
//
//   //class DatabaseHelper _instance = DatabaseHelper.internal();
//
//   static Database _db = _db ;
//
//   Future <Database> get db async {
//     if (_db != null){
//     return _db;
//   }
//     _db = await initDb();
//     return _db;
//   }
//
//    DatabaseHelper.internal();
//   initDb() async {
//     Directory documentDirectory = await getApplicationDocumentsDirectory();
//     String path = join(documentDirectory.path,"maindb.db");
//
//     var ourDb = await openDatabase(path,version: 1,onCreate: _onCreate);
//     return  ourDb;
//   }
//
//
//   void _onCreate(Database db, int version) async {
//     await db.execute(
//       "CREATE TABLE $tableUser($columbId INTEGER PRIMARY KEY,$columbUsername TEXT,$columbPassword TEXT)"
//     );
//   }
//   //CRUD- CREATE , READ , UPDATE , DELETE
//   //insertion
//
// Future<int> saveUser (User user) async {
//  var dbClient = await db;
//  int res = await dbClient.insert(tableUser, user.toMap());
//  return res;
// }
// // Get User
//   Future<List> getAllUsers() async {
//     var dbClient = await db;
//     var result = await dbClient.rawQuery("SELECT * FROM $tableUser");
//     return result.toList();
//   }
//   //Get Count of all items
// Future<int> getCount () async {
//     var dbClient = await db;
//     var Sqfite;
//     return Sqfite.firstIntValue(
//         await dbClient.rawQuery("SELECT COUNT(*) FROM $tableUser"));
// }
// // get A user
// Future <User?> getUser(int id) async{
//     var dbClient = await db;
//     var result = await dbClient.rawQuery(
//         "SELECT * FROM $tableUser WHERE $columbId = $id");
//     if (result.isEmpty) return null;
//     return User.fromMap(result.first);
// }
// // To delete a user
// Future<int> deleteUser (int id) async {
//     var  dbClient = await db;
//     return await dbClient.delete(
//         tableUser, where: "$columbId = ?",whereArgs: [id]);
//
// }
// // Update user
// Future<int> updateUser(User user)async {
//     var dbClient = await db;
//     return dbClient.update(
//       tableUser, user.toMap(), where: "$columbId = ?",whereArgs: [user.Id] );
// }
// Future close() async{
//     var dbClient = await db;
//     return dbClient.close();
// }
//
//
// }
