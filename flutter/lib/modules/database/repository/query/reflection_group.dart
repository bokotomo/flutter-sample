import 'package:sqflite/sqflite.dart' show Database;
import 'package:injectable/injectable.dart' show Injectable;
import 'package:gamer_reflection/modules/database/model/reflection_group.dart'
    show ModelReflectionGroup, tableNameReflectionGroup;
import 'package:gamer_reflection/modules/database/adapter/reflection_group.dart'
    show AdapterReflectionGroup;
import 'package:gamer_reflection/modules/domain/reflection_group.dart'
    show DomainReflectionGroup;

/// Interface: IRepositoryReflectionGroupQuery
abstract class IRepositoryReflectionGroupQuery {
  Future<List<DomainReflectionGroup>> getReflectionGroups(Database db);
}

/// Repository: 振り返りグループ
@Injectable(as: IRepositoryReflectionGroupQuery)
class RepositoryReflectionQuery extends IRepositoryReflectionGroupQuery {
  /// 取得: 振り返りグループ一覧
  @override
  Future<List<DomainReflectionGroup>> getReflectionGroups(Database db) async {
    final List<Map<String, Object?>> res = await db.query(
      tableNameReflectionGroup,
      columns: ['*'],
      limit: 100,
    );

    final List<ModelReflectionGroup> models = List.generate(res.length, (i) {
      return ModelReflectionGroup(
        id: res[i]['id'] as int,
        name: res[i]['name'] as String,
        createdAt:
            DateTime.tryParse(res[i]['created_at'] as String) ?? DateTime.now(),
      );
    });

    return AdapterReflectionGroup().domainReflectionGroups(models);
  }
}
