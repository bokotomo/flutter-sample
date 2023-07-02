import 'package:get_it/get_it.dart' show GetIt;
import 'package:sqflite/sqflite.dart' show Database;
import 'package:gamer_reflection/storage/rdb/repository/command/reflection.dart'
    show IRepositoryReflectionCommand;
import 'package:gamer_reflection/storage/rdb/driver/sqlite.dart'
    show DBConnection;
import 'package:gamer_reflection/modules/type/reflection.dart'
    show ReflectionType;
import 'package:gamer_reflection/domain/common/reflection_added.dart'
    show DomainReflectionAdded;

/// Request: Reflection
class RequestReflection {
  final IRepositoryReflectionCommand repositoryReflection =
      GetIt.I<IRepositoryReflectionCommand>();

  /// 新規追加: Reflection
  Future<void> addReflection(
    List<DomainReflectionAdded> reflections,
    int groupId,
  ) async {
    final Database db = GetIt.I<DBConnection>().db;
    await repositoryReflection.insertReflection(db, reflections, groupId);
  }

  /// 更新: Reflection
  Future<void> updateReflection(
    int id,
    String title,
    String detail,
    ReflectionType reflectionType,
  ) async {
    final Database db = GetIt.I<DBConnection>().db;
    await repositoryReflection.updateReflectionById(
      db,
      id,
      title,
      detail,
      reflectionType,
    );
  }

  /// 削除: Reflection
  Future<void> deleteReflection(int id) async {
    final Database db = GetIt.I<DBConnection>().db;
    await repositoryReflection.deleteReflectionById(db, id);
  }
}
