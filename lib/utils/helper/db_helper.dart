import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  static DbHelper helper = DbHelper._();

  DbHelper._();

  Database? db;

  Future<Database?> checkDB() async {
    if (db != null) {
      return db;
    } else {
      return await initDB();
    }
  }

  Future<Database> initDB() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, "Ajay.db");
    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        String query =
            "CREATE TABLE contact(id INTEGER PRIMARY KEY AUTOINCREMENT,name TEXT,mobile TEXT,msg TEXT,image BLOB)";
        db.execute(query);
      },
    );
  }

  Future<void> insertContactDB(
      String name, String mobile, String msg, String date, String time) async {
    db = await checkDB();
    String query =
        "INSERT INTO contact (name,mobile,msg) VALUES ('$name','$mobile','$msg')";
    db!.rawInsert(query);
  }

  Future<void> updateContactDB(
      String name, int id, String mobile, String msg,String date, String time) async {
    db = await checkDB();
    String query =
        "UPDATE contact SET name = '$name',mobile = '$mobile', msg = '$msg' WHERE id = '$id' ";
    db!.rawUpdate(query);
  }

  Future<void> deleteContactDB(int index) async {
    db = await checkDB();
    String query = "DELETE FROM contact WHERE id = '$index'";
    db!.rawDelete(query);
  }

  Future<List<Map>> readContactDB() async {
    db = await checkDB();
    String query = "SELECT * FROM contact";
    List<Map> l1 = await db!.rawQuery(query);
    return l1;
  }
}
