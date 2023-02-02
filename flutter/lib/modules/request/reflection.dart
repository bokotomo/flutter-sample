import 'package:get_it/get_it.dart';
import 'package:gamer_reflection/modules/database/repository/reflection.dart'
    show RepositoryReflection;
import 'package:gamer_reflection/modules/database/driver/sqlite.dart'
    show DBConnection;

/// 新規追加: Reflection
Future<void> addReflection(String text) async {
  final db = GetIt.I<DBConnection>().db;
  if (db == null) return;
  final repo = RepositoryReflection(db: db);
  await repo.insertReflection(text);
}
