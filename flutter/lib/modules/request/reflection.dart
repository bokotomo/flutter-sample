import 'package:get_it/get_it.dart';
import 'package:gamer_reflection/modules/database/repository/reflection.dart'
    show IRepositoryReflection;
import 'package:gamer_reflection/modules/database/driver/sqlite.dart'
    show DBConnection;

/// Request: Reflection
class RequestReflection {
  final IRepositoryReflection repositoryReflection =
      GetIt.I<IRepositoryReflection>();

  /// 新規追加: Reflection
  Future<void> addReflection(String text) async {
    final db = GetIt.I<DBConnection>().db;
    await repositoryReflection.insertReflection(db, text);
  }

  /// 削除: Reflection
  Future<void> deleteReflection(int id) async {
    final db = GetIt.I<DBConnection>().db;
    await repositoryReflection.deleteReflectionById(db, id);
  }
}
