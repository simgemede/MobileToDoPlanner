import 'package:mobile_to_do_planner/models/task.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBYardimci {
  static Database? _db;
  static final int _versiyon = 1;
  static final String _tableName = "gorevler";
  static final String _userTable = "users"; 

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

          db.execute(
            "CREATE TABLE $_tableName("
            "id INTEGER PRIMARY KEY AUTOINCREMENT,"
            "baslik STRING, not TEXT, tarih STRING,"
            "baslangicZamani STRING, bitisZamani STRING,"
            "hatirlatici INTEGER, tekrar STRING)",
          );

          // kullanıcı tablosu
          db.execute('''
            CREATE TABLE $_userTable(
              user_id INTEGER PRIMARY KEY AUTOINCREMENT,
              isim TEXT,
              email TEXT,
              sifre TEXT
            )
            ''');
        },
      );
    } catch (e) {
      print(e);
    }
  }

  // görev ekleme
  static Future<int> insert(Task? task) async {
    print("Insert function called.");
    return await _db?.insert(_tableName, task!.toJson()) ?? 1;
  }

  //kullanıcı ekleme
  static Future<int> insertUser(String isim, String email, String sifre) async {
    print("Inserting user...");
    int result = await _db?.insert(
          _userTable,
          {'isim': isim, 'email': email, 'sifre': sifre},
          conflictAlgorithm: ConflictAlgorithm.replace,
        ) ??
        1;

    if (result > 0) {
      print("Kullanıcı başarıyla eklendi: $isim"); // Başarılı ekleme mesajı
    } else {
      print("Kullanıcı eklenirken hata oluştu.");
    }

    return result;
  }

  static Future<bool> validateUser(String email, String password) async {
    final db = await _db;
    if (db == null) {
      print("Veritabanı bağlantısı sağlanamadı."); // Hata ayıklama
      return false; // Veritabanı bağlantısı yoksa false döner
    }

    final List<Map<String, dynamic>> result = await db.query(
      'users',
      where: 'email = ? AND sifre = ?',
      whereArgs: [email, password],
    );

    print("Kullanıcı sorgulandı: $email, $password"); // Hata ayıklama
    print("Sonuç: $result"); // Hata ayıklama
    return result.isNotEmpty; // Kullanıcı bulunduysa true döner
  }
}
