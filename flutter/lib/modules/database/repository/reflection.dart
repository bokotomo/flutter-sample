import 'package:sqflite/sqflite.dart';
import 'package:injectable/injectable.dart' show Injectable;
import 'package:gamer_reflection/modules/database/model/reflection.dart'
    show ModelReflection, tableNameReflection;
import 'package:gamer_reflection/modules/database/adapter/reflection.dart'
    show AdapterReflection;
import 'package:gamer_reflection/modules/domain/reflection.dart'
    show DomainReflection;

/// Interface: RepositoryReflection
abstract class IRepositoryReflection {
  Future<void> insertReflection(Database db, String text);
  Future<void> deleteReflection(Database db, int id);
  Future<List<DomainReflection>> getReflections(Database db);
  Future<DomainReflection> getReflectionById(Database db, int id);
}

/// Repository: Reflection
@Injectable(as: IRepositoryReflection)
class RepositoryReflection extends IRepositoryReflection {
  /// 追加: 振り返りの
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

  /// 追加: 振り返りの
  @override
  Future<void> deleteReflection(Database db, int id) async {
    await db.delete(
      tableNameReflection,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  /// 取得: 振り返り一覧
  @override
  Future<List<DomainReflection>> getReflections(Database db) async {
    final List<Map<String, Object?>> res =
        await db.rawQuery('SELECT * FROM reflection LIMIT 100');

    print(res);
    final models = List.generate(res.length, (i) {
      return ModelReflection(
        id: res[i]['id'] as int,
        text: res[i]['text'] as String,
        count: res[i]['count'] as int,
      );
    });

    return AdapterReflection().domainReflections(models);
  }

  /// 取得: 振り返り
  @override
  Future<DomainReflection> getReflectionById(Database db, int id) async {
    final List<Map<String, Object?>> res =
        await db.rawQuery('SELECT * FROM reflection WHERE id=?', [id]);

    print(res.first);
    final model = ModelReflection(
      id: res.first['id'] as int,
      text: res.first['text'] as String,
      count: res.first['count'] as int,
    );

    return AdapterReflection().domainReflection(model);
  }
}
