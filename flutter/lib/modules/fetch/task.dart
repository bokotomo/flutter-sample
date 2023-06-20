import 'package:get_it/get_it.dart' show GetIt;
import 'package:sqflite/sqflite.dart' show Database;
import 'package:gamer_reflection/domain/task/reflection.dart'
    show DomainTaskReflection;
import 'package:gamer_reflection/domain/common/reflection_group.dart'
    show DomainReflectionGroup;
import 'package:gamer_reflection/storage/rdb/repository/query/reflection.dart'
    show IRepositoryReflectionQuery;
import 'package:gamer_reflection/storage/rdb/repository/query/reflection_group.dart'
    show IRepositoryReflectionGroupQuery;
import 'package:gamer_reflection/storage/rdb/driver/sqlite.dart'
    show DBConnection;
import 'package:gamer_reflection/modules/adapter/reflection_group.dart'
    show AdapterReflectionGroup;
import 'package:gamer_reflection/modules/adapter/task.dart'
    show AdapterDomainTaskPage;

/// データ取得: タスク一覧ページ
class FetchTaskPage {
  final IRepositoryReflectionQuery repositoryReflection =
      GetIt.I<IRepositoryReflectionQuery>();
  final IRepositoryReflectionGroupQuery repositoryReflectionGroup =
      GetIt.I<IRepositoryReflectionGroupQuery>();

  /// 取得: 振り返り一覧
  Future<List<DomainTaskReflection>> fetchReflections(int groupId) async {
    final Database db = GetIt.I<DBConnection>().db;
    final models = await repositoryReflection.getReflections(db, groupId);
    return AdapterDomainTaskPage().domainReflections(models);
  }

  /// 取得: 振り返りグループ一覧
  Future<List<DomainReflectionGroup>> fetchReflectionGroups() async {
    final Database db = GetIt.I<DBConnection>().db;
    final models = await repositoryReflectionGroup.getReflectionGroups(db);
    return AdapterReflectionGroup().domainReflectionGroups(models);
  }
}
