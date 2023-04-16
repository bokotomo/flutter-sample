import 'package:get_it/get_it.dart' show GetIt;
import 'package:sqflite/sqflite.dart' show Database;
import 'package:gamer_reflection/modules/database/repository/command/reflection_group.dart'
    show IRepositoryReflectionGroupCommand;
import 'package:gamer_reflection/modules/database/driver/sqlite.dart'
    show DBConnection;

/// Request: ReflectionGroup
class RequestReflectionGroup {
  final IRepositoryReflectionGroupCommand repositoryReflectionGroup =
      GetIt.I<IRepositoryReflectionGroupCommand>();

  /// 新規追加: ReflectionGroup
  Future<int> addReflectionGroup(String name) async {
    final Database db = GetIt.I<DBConnection>().db;
    final id = await repositoryReflectionGroup.insertReflectionGroup(db, name);
    return id;
  }

  /// 更新: ReflectionGroup
  Future<void> updateReflectionGroup(
    int id,
    String name,
  ) async {
    final Database db = GetIt.I<DBConnection>().db;
    await repositoryReflectionGroup.updateReflectionGroupNameById(db, id, name);
  }

  /// 削除: ReflectionGroup
  Future<void> deleteReflection(int id) async {
    final Database db = GetIt.I<DBConnection>().db;
    await repositoryReflectionGroup.deleteReflectionGroupById(db, id);
  }
}
