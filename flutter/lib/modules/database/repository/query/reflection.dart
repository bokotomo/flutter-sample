import 'package:sqflite/sqflite.dart';
import 'package:injectable/injectable.dart' show Injectable;
import 'package:gamer_reflection/modules/database/model/reflection.dart'
    show ModelReflection, tableNameReflection;
import 'package:gamer_reflection/modules/database/adapter/reflection.dart'
    show AdapterReflection;
import 'package:gamer_reflection/modules/domain/reflection.dart'
    show DomainReflection;

/// Interface: RepositoryReflectionQuery
abstract class IRepositoryReflectionQuery {
  Future<List<DomainReflection>> getReflections(Database db);
  Future<DomainReflection> getReflectionById(Database db, int id);
}

/// Repository: 振り返り
@Injectable(as: IRepositoryReflectionQuery)
class RepositoryReflectionQuery extends IRepositoryReflectionQuery {
  /// 取得: 振り返り一覧
  @override
  Future<List<DomainReflection>> getReflections(Database db) async {
    final List<Map<String, Object?>> res = await db.query(
      tableNameReflection,
      columns: ['*'],
      limit: 100,
    );

    final List<ModelReflection> models = List.generate(res.length, (i) {
      return ModelReflection(
        id: res[i]['id'] as int,
        reflectionGroupId: res[i]['reflection_group_id'] as int,
        reflectionType: res[i]['reflection_type'] as int,
        text: res[i]['text'] as String,
        detail: res[i]['detail'] as String,
        count: res[i]['count'] as int,
        createdAt:
            DateTime.tryParse(res[i]['created_at'] as String) ?? DateTime.now(),
        updatedAt:
            DateTime.tryParse(res[i]['updated_at'] as String) ?? DateTime.now(),
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

    final ModelReflection model = ModelReflection(
      id: res.first['id'] as int,
      reflectionGroupId: res.first['reflection_group_id'] as int,
      reflectionType: res.first['reflection_type'] as int,
      text: res.first['text'] as String,
      detail: res.first['detail'] as String,
      count: res.first['count'] as int,
      createdAt: DateTime.tryParse(res.first['created_at'] as String) ??
          DateTime.now(),
      updatedAt: DateTime.tryParse(res.first['updated_at'] as String) ??
          DateTime.now(),
    );

    return AdapterReflection().domainReflection(model);
  }
}
