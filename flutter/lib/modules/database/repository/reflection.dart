import 'package:sqflite/sqflite.dart';
import 'package:gamer_reflection/modules/database/model/reflection.dart'
    show ModelReflection, tableNameReflection;

/// Repository: Reflection
class RepositoryReflection {
  const RepositoryReflection({required this.db});
  final Database db;

  /// 振り返りの追加
  Future<void> insertReflection(String text) async {
    final reflection = ModelReflection(
      text: text,
      count: 1,
    );

    await db.insert(
      tableNameReflection,
      reflection.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  /// 振り返りの一覧取得
  Future<List<ModelReflection>> getReflections() async {
    final List<Map<String, Object?>> res =
        await db.rawQuery('SELECT * FROM reflection LIMIT 100');

    print(res);
    return List.generate(res.length, (i) {
      return ModelReflection(
        id: res[i]['id'] as int,
        text: res[i]['text'] as String,
        count: res[i]['count'] as int,
      );
    });
  }
}
