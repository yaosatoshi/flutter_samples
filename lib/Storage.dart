import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DataModel {
  final int id;
  final String stringData;

  DataModel({this.id, this.stringData});

  Map<String, dynamic> toMap() {
    return {'id': id, 'stringData': stringData};
  }
}

class MyStorage {
  static final String DATABASE_FILENAME = 'test_database.db';
  static final int DATABASE_VERSION = 1;
  static final String DATABASE_TABLE_NAME = 'MYTEST';
  static final String INITIALIZE_ONCREATE_SQL =
      'CREATE TABLE ${DATABASE_TABLE_NAME}(id INTEGER PRIMARY KEY, stringData TEXT)';

  Database _db;

  void init() async {
    print("init() called.");
    _db = await _openDb();
  }

  void save(String dat) async {
    _insertDb(_db, DataModel(id: 0, stringData: dat));
    print("save() called. /stringData:$dat");
  }

  Future<String> load() async {
    final dm = await _fetchDb(_db);
    final ret = dm[0].stringData;
    print("load() called. /ret:$ret /dmsize:${dm.length}");
    return ret;
  }

  // private methods.

  Future<Database> _openDb() async {
    print("_openDb() called.");
    final db = await openDatabase(
      join(await getDatabasesPath(), DATABASE_FILENAME),
      onCreate: (db, version) async {
        print("_openDb() / onCreate() called.");
        final ret = db.execute(INITIALIZE_ONCREATE_SQL);
        await _insertDb(db, DataModel(id: 0, stringData: "(Not yet...)"));
        return ret;
      },
      version: DATABASE_VERSION,
    );
    return db;
  }

  Future<List<DataModel>> _fetchDb(Database db) async {
    final List<Map<String, dynamic>> maps = await db.query(DATABASE_TABLE_NAME);
    return List.generate(maps.length,
        (i) => DataModel(id: maps[i]['id'], stringData: maps[i]['stringData']));
  }

  Future<void> _insertDb(Database db, DataModel dm) async {
    await db.insert(DATABASE_TABLE_NAME, dm.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }
}
