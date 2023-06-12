import 'package:get_it/get_it.dart' show GetIt;
import 'package:sqflite/sqflite.dart' show Database;
import 'package:gamer_reflection/modules/domain/common/reflection_group.dart'
    show DomainReflectionGroup;
import 'package:gamer_reflection/modules/domain/todo/todo.dart' show DomainTodo;
import 'package:gamer_reflection/storage/rdb/repository/query/reflection_group.dart'
    show IRepositoryReflectionGroupQuery;
import 'package:gamer_reflection/storage/rdb/repository/query/todo.dart'
    show IRepositoryTodoQuery;
import 'package:gamer_reflection/storage/rdb/driver/sqlite.dart'
    show DBConnection;
import 'package:gamer_reflection/modules/adapter/reflection_group.dart'
    show AdapterReflectionGroup;
import 'package:gamer_reflection/modules/adapter/todo.dart' show AdapterTodo;

/// データ取得: タスク一覧ページ
class FetchTodoPage {
  final IRepositoryReflectionGroupQuery repositoryReflectionGroup =
      GetIt.I<IRepositoryReflectionGroupQuery>();
  final IRepositoryTodoQuery repositoryTodoQuery =
      GetIt.I<IRepositoryTodoQuery>();

  /// 取得: 振り返りグループ一覧
  Future<List<DomainReflectionGroup>> fetchReflectionGroups() async {
    final Database db = GetIt.I<DBConnection>().db;
    final models = await repositoryReflectionGroup.getReflectionGroups(db);
    return AdapterReflectionGroup().domainReflectionGroups(models);
  }

  /// 取得: やること一覧
  Future<List<DomainTodo>> fetchTodos(int groupId) async {
    final Database db = GetIt.I<DBConnection>().db;
    final models = await repositoryTodoQuery.getTodos(db, groupId);
    return AdapterTodo().domainTodos(models);
  }
}
