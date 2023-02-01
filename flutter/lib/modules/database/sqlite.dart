import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' show join;
import 'package:gamer_reflection/modules/database/repository/table.dart'
    show createTables;

/// sqliteの管理

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
      await createTables(db);
    },
  );

  return db;
}
