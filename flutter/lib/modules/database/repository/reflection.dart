import 'package:sqflite/sqflite.dart';
import 'package:injectable/injectable.dart' show Injectable;
import 'package:gamer_reflection/modules/database/model/reflection.dart'
    show ModelReflection, tableNameReflection;

/// Interface: RepositoryReflection
abstract class IRepositoryReflection {
  Future<void> insertReflection(Database db, String text);
  Future<List<ModelReflection>> getReflections(Database db);
}

/// Repository: Reflection
@Injectable(as: IRepositoryReflection)
class RepositoryReflection extends IRepositoryReflection {
  /// 振り返りの追加
  @override
  Future<void> insertReflection(Database db, String text) async {
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
  @override
  Future<List<ModelReflection>> getReflections(Database db) async {
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
