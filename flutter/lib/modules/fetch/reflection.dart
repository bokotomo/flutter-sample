import 'package:get_it/get_it.dart';
import 'package:sqflite/sqflite.dart' show Database;
import 'package:gamer_reflection/modules/domain/reflection.dart'
    show DomainReflection;
import 'package:gamer_reflection/modules/database/repository/query/reflection.dart'
    show IRepositoryReflectionQuery;
import 'package:gamer_reflection/modules/database/driver/sqlite.dart'
    show DBConnection;

/// Fetch: Reflection
class FetchReflection {
  final IRepositoryReflectionQuery repositoryReflection =
      GetIt.I<IRepositoryReflectionQuery>();

  /// 取得: 振り返り一覧
  Future<List<DomainReflection>> fetchReflections() async {
    final Database db = GetIt.I<DBConnection>().db;
    return await repositoryReflection.getReflections(db);
  }

  /// 取得: 振り返り
  Future<DomainReflection> fetchReflectionById(int id) async {
    final Database db = GetIt.I<DBConnection>().db;
    return await repositoryReflection.getReflectionById(db, id);
  }
}
