import 'package:get_it/get_it.dart' show GetIt;
import 'package:sqflite/sqflite.dart' show Database;
import 'package:gamer_reflection/storage/rdb/repository/command/reflection_history_group.dart'
    show IRepositoryReflectionHistoryGroupCommand;
import 'package:gamer_reflection/storage/rdb/driver/sqlite.dart'
    show DBConnection;
import 'package:gamer_reflection/domain/common/reflection_added.dart'
    show DomainReflectionAdded;

/// Request: ReflectionHistoryGroup
class RequestReflectionHistoryGroup {
  final IRepositoryReflectionHistoryGroupCommand
      repositoryReflectionHistoryGroup =
      GetIt.I<IRepositoryReflectionHistoryGroupCommand>();

  /// 新規追加: ReflectionHistoryGroup
  Future<void> addReflectionHisotry(
    List<DomainReflectionAdded> reflections,
    int groupId,
  ) async {
    final Database db = GetIt.I<DBConnection>().db;
    await repositoryReflectionHistoryGroup
        .insertAndDeleteReflectionHistoryGroup(db, reflections, groupId);
  }
}
