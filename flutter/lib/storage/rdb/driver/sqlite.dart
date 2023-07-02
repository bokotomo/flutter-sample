import 'package:sqflite/sqflite.dart'
    show Database, getDatabasesPath, openDatabase;
import 'package:path/path.dart' show join;
import 'package:gamer_reflection/storage/rdb/repository/table.dart'
    show TableSetUp;

import 'package:gamer_reflection/storage/rdb/repository/debug.dart'
    show TableDebug;

/// sqliteの管理

/// DBConnection
class DBConnection {
  DBConnection({required this.db});
  final Database db;
}

/// データベースの初期化
Future<Database> initDatabase() async {
  const databaseName = "app_db";
  const version = 1;

  var databasesPath = await getDatabasesPath();
  String path = join(databasesPath, databaseName);

  Database db = await openDatabase(
    path,
    version: version,
    onCreate: (Database db, int version) async {
      await TableSetUp().createTables(db);
    },
  );

  /// DEBUG MODE
  // await TableSetUp().createTables(db); // 消す
  // await TableDebug().dropKVS(db); // 消す
  // await TableDebug().dropAllTables(db); // 消す
  await TableDebug().showRecords(db); // コメントアウトする

  return db;
}
