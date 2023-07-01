import 'package:sqflite/sqflite.dart' show Database;
import 'package:injectable/injectable.dart' show Injectable;
import 'package:gamer_reflection/storage/rdb/model/reflection_history_group.dart'
    show ModelReflectionHistoryGroup, tableNameReflectionHistoryGroup;

/// Interface: RepositoryReflectionHistoryGroupQuery
abstract class IRepositoryReflectionHistoryGroupQuery {
  Future<List<ModelReflectionHistoryGroup>> getReflectionHistoryGroups(
    Database db,
  );
}

/// Repository: 振り返り履歴のグループ
@Injectable(as: IRepositoryReflectionHistoryGroupQuery)
class RepositoryReflectionHistoryGroupQuery
    extends IRepositoryReflectionHistoryGroupQuery {
  /// 取得: 振り返り履歴のグループ一覧
  @override
  Future<List<ModelReflectionHistoryGroup>> getReflectionHistoryGroups(
      Database db) async {
    final List<Map<String, Object?>> res = await db.query(
      tableNameReflectionHistoryGroup,
      columns: ['*'],
      orderBy: "id DESC",
      limit: 100,
    );

    return List.generate(res.length, (i) {
      return ModelReflectionHistoryGroup(
        id: res[i]['id'] as int,
        reflectionGroupId: res[i]['reflection_group_id'] as int,
        date: DateTime.tryParse(res[i]['date'] as String) ?? DateTime.now(),
      );
    });
  }
}
