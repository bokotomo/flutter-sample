import 'package:get_it/get_it.dart' show GetIt;
import 'package:sqflite/sqflite.dart' show Database;
import 'package:gamer_reflection/storage/rdb/repository/command/reflection.dart'
    show IRepositoryReflectionCommand;
import 'package:gamer_reflection/storage/rdb/driver/sqlite.dart'
    show DBConnection;
import 'package:gamer_reflection/storage/rdb/model/reflection.dart'
    show ModelReflection;
import 'package:gamer_reflection/modules/type/reflection.dart'
    show ReflectionType;

/// Request: Reflection
class RequestReflection {
  final IRepositoryReflectionCommand repositoryReflection =
      GetIt.I<IRepositoryReflectionCommand>();

  /// 新規追加: Reflection
  Future<void> addReflection(String text, bool isGood, int groupId) async {
    final Database db = GetIt.I<DBConnection>().db;
    await repositoryReflection.insertReflection(db, text, isGood, groupId);
  }

  /// 更新: Reflection
  Future<void> updateReflection(
    int id,
    String title,
    String detail,
    ReflectionType reflectionType,
  ) async {
    final Database db = GetIt.I<DBConnection>().db;
    // todo
    final model = ModelReflection(
      text: title,
      detail: detail,
      reflectionGroupId: 0,
      reflectionType: reflectionType == ReflectionType.good ? 1 : 2,
      count: 0,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
    await repositoryReflection.updateReflectionById(db, id, model);
  }

  /// 削除: Reflection
  Future<void> deleteReflection(int id) async {
    final Database db = GetIt.I<DBConnection>().db;
    await repositoryReflection.deleteReflectionById(db, id);
  }
}
