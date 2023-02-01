import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as p;
import 'package:gamer_reflection/modules/database/repository/reflection.dart'
    show createTables;

/// sqliteの管理

/// データベースの初期化
Future<Database> initDatabase() async {
  const databaseName = "app_db";

  var databasesPath = await getDatabasesPath();
  String path = p.join(databasesPath, databaseName);

  Database db = await openDatabase(
    path,
    version: 1,
    onCreate: (Database db, int version) async {
      await createTables(db);
    },
  );

  return db;
}
