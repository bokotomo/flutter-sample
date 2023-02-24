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
  Future<void> updateReflectionById(Database db, int id, ModelReflection model);
  Future<void> deleteReflectionById(Database db, int id);
  Future<List<DomainReflection>> getReflections(Database db);
  Future<DomainReflection> getReflectionById(Database db, int id);
}

/// Repository: 振り返り
@Injectable(as: IRepositoryReflection)
class RepositoryReflection extends IRepositoryReflection {
  /// 追加: 振り返り
  @override
  Future<void> insertReflection(Database db, String text) async {
    /// idにする
    final List<Map<String, Object?>> res = await db.query(
      tableNameReflection,
      columns: ['id', 'count'],
      where: '"text" = ?',
      whereArgs: [text],
    );

    if (res.isEmpty) {
      /// 新規登録
      final reflection = ModelReflection(
        reflectionGroupId: 1,
        reflectionType: 1,
        text: text,
        detail: "",
        count: 1,
      );

      await db.insert(
        tableNameReflection,
        reflection.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } else {
      /// まだ登録されてない
      final id = res.first['id'] as int;
      final count = res.first['count'] as int;

      final reflection = ModelReflection(
        reflectionGroupId: 0,
        reflectionType: 0,
        text: "",
        detail: "",
        count: count + 1,
      );

      await db.update(
        tableNameReflection,
        reflection.toMapCount(),
        where: 'id = ?',
        whereArgs: [id],
      );
    }
  }

  /// 更新: 指定したIDの振り返り
  @override
  Future<void> updateReflectionById(
    Database db,
    int id,
    ModelReflection model,
  ) async {
    final Map<String, Object?> map = {}
      ..addAll(model.toMapText())
      ..addAll(model.toMapDetail());

    await db.update(
      tableNameReflection,
      map,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  /// 削除: 指定したIDの振り返り
  @override
  Future<void> deleteReflectionById(Database db, int id) async {
    await db.delete(
      tableNameReflection,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  /// 取得: 振り返り一覧
  @override
  Future<List<DomainReflection>> getReflections(Database db) async {
    final List<Map<String, Object?>> res = await db.query(
      tableNameReflection,
      columns: ['*'],
      limit: 100,
    );

    final models = List.generate(res.length, (i) {
      return ModelReflection(
        id: res[i]['id'] as int,
        reflectionGroupId: res[i]['reflection_group_id'] as int,
        reflectionType: res[i]['reflection_type'] as int,
        text: res[i]['text'] as String,
        detail: res[i]['detail'] as String,
        count: res[i]['count'] as int,
      );
    });

    return AdapterReflection().domainReflections(models);
  }

  /// 取得: 指定したIDの振り返り
  @override
  Future<DomainReflection> getReflectionById(Database db, int id) async {
    final List<Map<String, Object?>> res = await db.query(
      tableNameReflection,
      columns: ['*'],
      where: '"id" = ?',
      whereArgs: [id],
    );

    final model = ModelReflection(
      id: res.first['id'] as int,
      reflectionGroupId: res.first['reflection_group_id'] as int,
      reflectionType: res.first['reflection_type'] as int,
      text: res.first['text'] as String,
      detail: res.first['detail'] as String,
      count: res.first['count'] as int,
    );

    return AdapterReflection().domainReflection(model);
  }
}
