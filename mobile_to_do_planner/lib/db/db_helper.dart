import 'package:mobile_to_do_planner/models/task.dart';
import 'package:sqflite/sqflite.dart';

class DBYardimci {
  static Database? _db;
  static final int _versiyon = 1;
  static final String _tableName = "gorevler";

  static Future<void> initDb() async {
    if (_db != null) {
      return;
    }
    try {
      String _yol = await getDatabasesPath() + 'gorevler.db';
      _db = await openDatabase(
        _yol,
        version: _versiyon,
        onCreate: (db, version) {
          print("Creating a new one");
          return db.execute(
            "CREATE TABLE $_tableName("
            "id INTEGER PRIMARY KEY AUTOINCREMENT,"
            "baslik STRING, not TEXT, tarih STRING,"
            "baslangicZamani STRING, bitisZamani STRING,"
            "hatirlatici INTEGER, tekrar STRING)",
          );
        },
      );
    } catch (e) {
      print(e);
    }
  }

  static Future<int> insert(Task? task) async {
    print("Insert function called.");
    return await _db?.insert(_tableName, task!.toJson()) ?? 1;
  }
}
