import 'package:get_it/get_it.dart' show GetIt;
import 'package:sqflite/sqflite.dart' show Database;
import 'package:gamer_reflection/storage/rdb/repository/query/reflection_group.dart'
    show IRepositoryReflectionGroupQuery;
import 'package:gamer_reflection/storage/rdb/driver/sqlite.dart'
    show DBConnection;
import 'package:gamer_reflection/api/query/adapter/reflection_group.dart'
    show AdapterReflectionGroup;

/// データ取得: メインページ
class FetchRootPage {
  final IRepositoryReflectionGroupQuery rReflectionGroup =
      GetIt.I<IRepositoryReflectionGroupQuery>();

  /// 取得: 振り返りグループがあるか
  Future<bool> reflectionGroupsExist() async {
    final Database db = GetIt.I<DBConnection>().db;
    final models = await rReflectionGroup.getReflectionGroups(db);
    return AdapterReflectionGroup().domainReflectionGroups(models).isNotEmpty;
  }
}
