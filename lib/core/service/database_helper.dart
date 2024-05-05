part of 'service_dependencies.dart';

class DatabaseHelperTableNames {
  static const String medicineSchedule = 'medicine_schedule';
}

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();

  factory DatabaseHelper() => _instance;

  DatabaseHelper._internal();

  Future<Database> _initializeDatabase() async {
    String documentsDirectory = await getDatabasesPath();
    String path = join(documentsDirectory, 'medicine_schedule.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  late final Future<Database> _database = _initializeDatabase();

  Future<Database> get database async {
    return await _database;
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE IF NOT EXISTS ${DatabaseHelperTableNames.medicineSchedule}(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            session TEXT,
            icon TEXT,
            isActived INTEGER,
            hour INTEGER,
            minute INTEGER
          )
      ''');

    List<Map<String, dynamic>> data =
        await db.query(DatabaseHelperTableNames.medicineSchedule);

    if (data.isEmpty) {
      List<Map<String, dynamic>> initialData = [
        {
          'session': 'Buổi sáng',
          'icon': 'wb_sunny_outlined',
          'isActived': 0,
          'hour': 8,
          'minute': 0,
        },
        {
          'session': 'Buổi trưa',
          'icon': 'sunny',
          'isActived': 0,
          'hour': 12,
          'minute': 0,
        },
        {
          'session': 'Buổi chiều',
          'icon': 'sunny_snowing',
          'isActived': 0,
          'hour': 16,
          'minute': 0,
        },
        {
          'session': 'Buổi tối',
          'icon': 'nightlight_round',
          'isActived': 0,
          'hour': 20,
          'minute': 0,
        },
        {
          'session': 'Trước khi ngủ',
          'icon': 'night_shelter',
          'isActived': 0,
          'hour': 22,
          'minute': 0,
        },
        {
          'session': 'Tự do',
          'icon': 'accessibility_outlined',
          'isActived': 0,
          'hour': 0,
          'minute': 0,
        },
      ];

      for (var data in initialData) {
        await db.insert(DatabaseHelperTableNames.medicineSchedule, data);
      }
    }
  }

  Future<int> insertData(Map<String, dynamic> data, String tableName) async {
    Database db = await database;
    return await db.insert(tableName, data);
  }

  Future<List<Map<String, dynamic>>> retrieveData(String tableName) async {
    Database db = await database;
    return await db.query(tableName);
  }

  Future<int> updateData(
      Map<String, dynamic> data, String tableName, int id) async {
    Database db = await database;
    return await db.update(tableName, data, where: 'id = ?', whereArgs: [id]);
  }

  Future<int> deleteData(String tableName, int id) async {
    Database db = await database;
    return await db.delete(tableName, where: 'id = ?', whereArgs: [id]);
  }

  Future<void> close() async {
    final db = await _database;
    if (db.isOpen) {
      await db.close();
    }
  }
}
