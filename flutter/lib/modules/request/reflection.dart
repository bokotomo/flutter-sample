import 'package:get_it/get_it.dart';
import 'package:gamer_reflection/modules/database/repository/reflection.dart'
    show IRepositoryReflection;
import 'package:gamer_reflection/modules/database/driver/sqlite.dart'
    show DBConnection;
import 'package:gamer_reflection/modules/database/model/reflection.dart'
    show ModelReflection;

/// Request: Reflection
class RequestReflection {
  final IRepositoryReflection repositoryReflection =
      GetIt.I<IRepositoryReflection>();

  /// 新規追加: Reflection
  Future<void> addReflection(String text) async {
    final db = GetIt.I<DBConnection>().db;
    await repositoryReflection.insertReflection(db, text);
  }

  /// 更新: Reflection
  Future<void> updateReflection(int id, String title, String detail) async {
    final db = GetIt.I<DBConnection>().db;
    // todo
    final model = ModelReflection(
      text: title,
      detail: detail,
      reflectionGroupId: 0,
      reflectionType: 0,
      count: 0,
    );
    await repositoryReflection.updateReflectionById(db, id, model);
  }

  /// 削除: Reflection
  Future<void> deleteReflection(int id) async {
    final db = GetIt.I<DBConnection>().db;
    await repositoryReflection.deleteReflectionById(db, id);
  }
}
