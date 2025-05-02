// ignore: file_names
// ignore: file_names
// // ignore_for_file: prefer_interpolation_to_compose_strings, avoid_print

// import 'dart:io';

// import 'package:get/get.dart';
// import 'package:path/path.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:sqflite/sqflite.dart';

// // Create a Class
// class UserDatabase extends GetxController {
//   // Class Call
//   static final UserDatabase instance = UserDatabase();
//   static Database? _database;
//   UserDatabase();

//   // Condition for check whether data is there or not
//   Future<Database> get database async {
//     if (_database != null) return _database!;

//     _database = await initdatabase();
//     return _database!;
//   }

//   // Create a database
//   Future<Database> initdatabase() async {
//     Directory directory = await getApplicationDocumentsDirectory();
//     print('Here is the document directory:' + directory.path);
//     final String path = join(await getDatabasesPath(), 'UserDatabase.db');
//     return await openDatabase(
//       path,
//       version: 1,
//       onCreate: createtable,
//     );
//   }

//   // Create a table for the above database
//   Future<void> createtable(Database db, int version) async {
//     return await db.execute('''
//     CREATE TABLE userdatatable (
//       id INTEGER PRIMARY KEY,
//       name TEXT,
//       phone TEXT,
//       TEXT,
//        TEXT
//     )
//   ''');
//   }

//   // CRUD operation

//   // Function for Creating or Insert data in the table
//   Future<int> insertdata(Map<String, dynamic> data) async {
//     Database db = await instance.database;
//     return await db.insert('userdatatable', data);
//   }

//   // Function to get the data present in table
//   Future<List<Map<String, dynamic>>> getdata() async {
//     Database db = await instance.database;
//     return await db.query('userdatatable');
//   }

//   // Function to update data in the table
//   Future<int> updatedata(Map<String, dynamic> data) async {
//     Database db = await instance.database;
//     int id = data['id'];
//     return await db.update(
//       'userdatatable',
//       data,
//       where: 'id=?',
//       whereArgs: [id],
//     );
//   }

//   // Function to delete data in table
//   Future<int> deletedata(int id) async {
//     Database db = await instance.database;
//     return await db.delete(
//       'userdatatable',
//       where: 'id=?',
//       whereArgs: [id],
//     );
//   }
// }
