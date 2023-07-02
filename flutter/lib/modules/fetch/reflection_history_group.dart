import 'package:get_it/get_it.dart' show GetIt;
import 'package:sqflite/sqflite.dart' show Database;
import 'package:gamer_reflection/domain/reflection_history_group/reflection_history_group.dart'
    show DomainReflectionHistoryGroup;
import 'package:gamer_reflection/storage/rdb/repository/query/reflection_history_group.dart'
    show IRepositoryReflectionHistoryGroupQuery;
import 'package:gamer_reflection/storage/rdb/driver/sqlite.dart'
    show DBConnection;
import 'package:gamer_reflection/modules/adapter/reflection_history_group.dart'
    show AdapterReflectionHistoryGroup;

/// データ取得: 振り返り履歴グループページ
class FetchReflectionHistoryGroupPage {
  final IRepositoryReflectionHistoryGroupQuery
      repositoryReflectionHistoryGroup =
      GetIt.I<IRepositoryReflectionHistoryGroupQuery>();

  /// 取得:  振り返り履歴グループ一覧
  Future<List<DomainReflectionHistoryGroup>> fetchReflectionHistoryGroups(
      int reflectionGroupId) async {
    final Database db = GetIt.I<DBConnection>().db;
    final models = await repositoryReflectionHistoryGroup
        .getReflectionHistoryGroups(db, reflectionGroupId);
    return AdapterReflectionHistoryGroup()
        .domainReflectionHistoryGroups(models);
  }
}
