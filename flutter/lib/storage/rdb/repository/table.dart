import 'package:sqflite/sqflite.dart' show Database;

/// DB: テーブルのセットアップ
class TableSetUp {
  /// テーブルの作成
  /// 後でマイグレーションファイルに合わせるので一時的
  Future<void> createTables(Database db) async {
    try {
      print("---- Setup Table ----");

      // 外部キー有効化
      await db.execute("PRAGMA foreign_keys=true");

      // 振り返り
      await db.execute('''
CREATE TABLE IF NOT EXISTS reflection(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  reflection_group_id INTEGER NOT NULL,
  text TEXT NOT NULL,
  detail TEXT NOT NULL DEFAULT "",
  reflection_type INTEGER NOT NULL,
  count INTEGER NOT NULL,
  created_at TIMESTAMP DEFAULT (datetime(CURRENT_TIMESTAMP, 'localtime')),
  updated_at TEXT NOT NULL DEFAULT (DATETIME('now', 'localtime')),
  foreign key (reflection_group_id) references reflection_group(id) on delete cascade
)
''');

      // 振り返りグループ
      await db.execute('''
CREATE TABLE IF NOT EXISTS reflection_group(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT NOT NULL,
  created_at TIMESTAMP DEFAULT (datetime(CURRENT_TIMESTAMP, 'localtime'))
)
''');

      // やることリスト
      await db.execute('''
CREATE TABLE IF NOT EXISTS todo(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  reflection_id INTEGER NOT NULL,
  created_at TIMESTAMP DEFAULT (datetime(CURRENT_TIMESTAMP, 'localtime')),
  foreign key (reflection_id) references reflection(id) on delete cascade
)
''');
    } catch (e) {
      //todo
      rethrow;
    }
  }

  /// デバック用: テーブルの全削除
  Future<void> dropAllTables(bool isDebugMode, Database db) async {
    print("---- Drop Tables Start ----");
    await db.execute("DELETE FROM reflection;");
    await db.execute("DROP TABLE reflection;");
    await db.execute("DELETE FROM reflection_group;");
    await db.execute("DROP TABLE reflection_group;");
    await db.execute("DELETE FROM todo;");
    await db.execute("DROP TABLE todo;");
    print("---- Drop Tables End ----");
  }

  /// デバック用: レコードを全て表示
  Future<void> showRecords(bool isDebugMode, Database db) async {
    final List<Map<String, Object?>> todos =
        await db.rawQuery('SELECT * FROM todo');
    final List<Map<String, Object?>> reflections =
        await db.rawQuery('SELECT * FROM reflection');
    final List<Map<String, Object?>> reflectionGroups =
        await db.rawQuery('SELECT * FROM reflection_group');

    print("---- Records ----");
    print("Todos");
    print(todos);
    print("Reflections");
    print(reflections);
    print("ReflectionGroups");
    print(reflectionGroups);
  }
}
