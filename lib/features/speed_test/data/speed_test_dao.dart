import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../domain/models/speed_test_history.dart';

class SpeedTestDao {
  static const _tableName = 'speed_test_history';
  static Database? _db;

  Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await _initDB('speed_test.db');
    return _db!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $_tableName (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        timestamp TEXT NOT NULL,
        downloadMbps REAL NOT NULL,
        uploadMbps REAL NOT NULL,
        pingMs INTEGER NOT NULL,
        jitterMs INTEGER NOT NULL,
        serverName TEXT NOT NULL,
        networkType TEXT NOT NULL,
        connectionInfo TEXT NOT NULL
      )
    ''');
  }

  Future<void> insertResult(SpeedTestHistory result) async {
    final db = await database;
    final map = result.toJson();
    map['timestamp'] = result.timestamp.toIso8601String(); 
    await db.insert(_tableName, map);
  }

  Future<List<SpeedTestHistory>> getAllResults() async {
    final db = await database;
    final result = await db.query(_tableName, orderBy: 'timestamp DESC');
    return result.map((e) {
      final map = Map<String, dynamic>.from(e);
      return SpeedTestHistory.fromJson(map);
    }).toList();
  }

  Future<void> deleteResult(int id) async {
    final db = await database;
    await db.delete(_tableName, where: 'id = ?', whereArgs: [id]);
  }

  Future<void> clearAll() async {
    final db = await database;
    await db.delete(_tableName);
  }
}
