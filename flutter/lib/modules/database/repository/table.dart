import 'package:sqflite/sqflite.dart' show Database;

///
class TableSetUp {
  /// テーブルの作成
  Future<void> createTables(Database db) async {
    try {
      await db.execute('''
CREATE TABLE IF NOT EXISTS reflection(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  text TEXT NOT NULL, count INTEGER NOT NULL,
  created_at TIMESTAMP DEFAULT (datetime(CURRENT_TIMESTAMP,'localtime'))
)
''');
    } catch (e) {
      //todo
      rethrow;
    }
  }
}
