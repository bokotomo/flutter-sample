import 'package:get_it/get_it.dart' show GetIt;
import 'package:sqflite/sqflite.dart' show Database;
import 'package:gamer_reflection/modules/domain/reflection.dart'
    show DomainReflection;
import 'package:gamer_reflection/storage/rdb/repository/query/reflection.dart'
    show IRepositoryReflectionQuery;
import 'package:gamer_reflection/storage/rdb/driver/sqlite.dart'
    show DBConnection;

/// データ取得: 振り返り詳細ページ
class FetchTaskDetailPage {
  final IRepositoryReflectionQuery repositoryReflection =
      GetIt.I<IRepositoryReflectionQuery>();

  /// 取得: 振り返り詳細
  Future<DomainReflection> fetchReflectionById(int id) async {
    final Database db = GetIt.I<DBConnection>().db;
    return await repositoryReflection.getReflectionById(db, id);
  }
}
