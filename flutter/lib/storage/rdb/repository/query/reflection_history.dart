import 'package:sqflite/sqflite.dart' show Database;
import 'package:injectable/injectable.dart' show Injectable;
import 'package:gamer_reflection/storage/rdb/model/reflection_history.dart'
    show ModelReflectionHistory, tableNameReflectionHistory;

/// Interface: RepositoryReflectionHistoryQuery
abstract class IRepositoryReflectionHisotryQuery {
  Future<List<ModelReflectionHistory>> getReflectionHistoryByGroupId(
    Database db,
    int reflectionHistoryGroupId,
  );
}

/// Repository: 振り返り履歴
@Injectable(as: IRepositoryReflectionHisotryQuery)
class RepositoryReflectionHistoryQuery
    extends IRepositoryReflectionHisotryQuery {
  /// 取得: グループ中の振り返り履歴一覧
  @override
  Future<List<ModelReflectionHistory>> getReflectionHistoryByGroupId(
    Database db,
    int reflectionHistoryGroupId,
  ) async {
    final List<Map<String, Object?>> res = await db.query(
      tableNameReflectionHistory,
      columns: ['*'],
      limit: 100,
    );

    return List.generate(res.length, (i) {
      return ModelReflectionHistory(
        id: res[i]['id'] as int,
        reflectionHistoryGroupId: res[i]['reflection_history_group_id'] as int,
        reflectionType: res[i]['reflection_type'] as int,
        text: res[i]['text'] as String,
        count: res[i]['count'] as int,
      );
    });
  }
}
