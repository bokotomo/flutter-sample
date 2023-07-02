import 'package:get_it/get_it.dart' show GetIt;
import 'package:sqflite/sqflite.dart' show Database;
import 'package:gamer_reflection/domain/reflection_history/reflection_history.dart'
    show DomainReflectionHistory;
import 'package:gamer_reflection/storage/rdb/repository/query/reflection_history.dart'
    show IRepositoryReflectionHisotryQuery;
import 'package:gamer_reflection/storage/rdb/driver/sqlite.dart'
    show DBConnection;
import 'package:gamer_reflection/modules/adapter/reflection_history.dart'
    show AdapterReflectionHistory;

/// データ取得: 振り返り履歴詳細ページ
class FetchReflectionHistoryPage {
  final IRepositoryReflectionHisotryQuery repositoryReflectionHistory =
      GetIt.I<IRepositoryReflectionHisotryQuery>();

  /// 取得:  振り返り履歴グループ一覧
  Future<List<DomainReflectionHistory>> fetchReflectionHistoryGroups(
      int historyGroupId) async {
    final Database db = GetIt.I<DBConnection>().db;
    final models = await repositoryReflectionHistory
        .getReflectionHistoryByGroupId(db, historyGroupId);
    return AdapterReflectionHistory().domainReflectionHistorys(models);
  }
}
