import 'package:get_it/get_it.dart' show GetIt;
import 'package:sqflite/sqflite.dart' show Database;
import 'package:gamer_reflection/domain/solution_detail/reflection.dart'
    show DomainSolutionDetailReflection;
import 'package:gamer_reflection/storage/rdb/repository/query/reflection.dart'
    show IRepositoryReflectionQuery;
import 'package:gamer_reflection/storage/rdb/repository/query/todo.dart'
    show IRepositoryTodoQuery;
import 'package:gamer_reflection/storage/rdb/driver/sqlite.dart'
    show DBConnection;
import 'package:gamer_reflection/modules/adapter/solution_detail.dart'
    show AdapterDomainSolutionDetailPage;

/// データ取得: 振り返り詳細ページ
class FetchSolutionDetailPage {
  final IRepositoryReflectionQuery repositoryReflection =
      GetIt.I<IRepositoryReflectionQuery>();
  final IRepositoryTodoQuery repositoryTodo = GetIt.I<IRepositoryTodoQuery>();

  /// 取得: 振り返り詳細
  Future<DomainSolutionDetailReflection> fetchReflectionById(int id) async {
    final Database db = GetIt.I<DBConnection>().db;
    final model = await repositoryReflection.getReflectionById(db, id);
    return AdapterDomainSolutionDetailPage().domainReflection(model);
  }

  /// 取得: やることが追加されているか
  Future<bool> fetchTodoExistById(int id) async {
    final Database db = GetIt.I<DBConnection>().db;
    return await repositoryTodo.todoExist(db, id);
  }
}
