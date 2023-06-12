import 'package:sqflite/sqflite.dart' show Database;

/// DB: テーブルのセットアップ
class TableSetUp {
  /// テーブルの作成
  /// 後でマイグレーションファイルに合わせるので一時的
  Future<void> createTables(Database db) async {
    try {
      // 振り返り
      await db.execute('''
CREATE TABLE IF NOT EXISTS reflection(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  reflection_group_id INTEGER NOT NULL,
  text TEXT NOT NULL,
  detail TEXT NOT NULL DEFAULT "",
  reflection_type INTEGER NOT NULL,
  count INTEGER NOT NULL,
  created_at TIMESTAMP DEFAULT (datetime(CURRENT_TIMESTAMP,'localtime')),
  updated_at TEXT NOT NULL DEFAULT (DATETIME('now', 'localtime'))
)
''');

      // 振り返りグループ
      await db.execute('''
CREATE TABLE IF NOT EXISTS reflection_group(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT NOT NULL,
  created_at TIMESTAMP DEFAULT (datetime(CURRENT_TIMESTAMP,'localtime'))
)
''');

      // やることリスト
      await db.execute('''
CREATE TABLE IF NOT EXISTS todo(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  reflection_id INTEGER NOT NULL,
  created_at TIMESTAMP DEFAULT (datetime(CURRENT_TIMESTAMP,'localtime'))
)
''');
    } catch (e) {
      //todo
      rethrow;
    }
  }
}
