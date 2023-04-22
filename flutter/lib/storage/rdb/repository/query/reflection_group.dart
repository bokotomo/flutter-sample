import 'package:sqflite/sqflite.dart' show Database;
import 'package:injectable/injectable.dart' show Injectable;
import 'package:gamer_reflection/storage/rdb/model/reflection_group.dart'
    show ModelReflectionGroup, tableNameReflectionGroup;

/// Interface: IRepositoryReflectionGroupQuery
abstract class IRepositoryReflectionGroupQuery {
  Future<List<ModelReflectionGroup>> getReflectionGroups(Database db);
}

/// Repository: 振り返りグループ
@Injectable(as: IRepositoryReflectionGroupQuery)
class RepositoryReflectionQuery extends IRepositoryReflectionGroupQuery {
  /// 取得: 振り返りグループ一覧
  @override
  Future<List<ModelReflectionGroup>> getReflectionGroups(Database db) async {
    final List<Map<String, Object?>> res = await db.query(
      tableNameReflectionGroup,
      columns: ['*'],
      limit: 100,
    );

    return List.generate(res.length, (i) {
      return ModelReflectionGroup(
        id: res[i]['id'] as int,
        name: res[i]['name'] as String,
        createdAt:
            DateTime.tryParse(res[i]['created_at'] as String) ?? DateTime.now(),
      );
    });
  }
}
