import 'package:sqflite/sqflite.dart';

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

/// 振り返りの追加
Future<void> insertReflection(Database db, String text) async {
  await db.execute("INSERT INTO reflection (text, count) values('$text', 1)");

  final reflections = await db.rawQuery('SELECT * FROM reflection');

  print(reflections);
}
