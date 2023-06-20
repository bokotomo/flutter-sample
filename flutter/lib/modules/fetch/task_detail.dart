import 'package:get_it/get_it.dart' show GetIt;
import 'package:sqflite/sqflite.dart' show Database;
import 'package:gamer_reflection/domain/task_detail/reflection.dart'
    show DomainTaskDetailReflection;
import 'package:gamer_reflection/storage/rdb/repository/query/reflection.dart'
    show IRepositoryReflectionQuery;
import 'package:gamer_reflection/storage/rdb/repository/query/todo.dart'
    show IRepositoryTodoQuery;
import 'package:gamer_reflection/storage/rdb/driver/sqlite.dart'
    show DBConnection;
import 'package:gamer_reflection/modules/adapter/task_detail.dart'
    show AdapterDomainTaskDetailPage;

/// データ取得: 振り返り詳細ページ
class FetchTaskDetailPage {
  final IRepositoryReflectionQuery repositoryReflection =
      GetIt.I<IRepositoryReflectionQuery>();
  final IRepositoryTodoQuery repositoryTodo = GetIt.I<IRepositoryTodoQuery>();

  /// 取得: 振り返り詳細
  Future<DomainTaskDetailReflection> fetchReflectionById(int id) async {
    final Database db = GetIt.I<DBConnection>().db;
    final model = await repositoryReflection.getReflectionById(db, id);
    return AdapterDomainTaskDetailPage().domainReflection(model);
  }

  /// 取得: やることが追加されているか
  Future<bool> fetchTodoExistById(int id) async {
    final Database db = GetIt.I<DBConnection>().db;
    return await repositoryTodo.todoExist(db, id);
  }
}
