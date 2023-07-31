import 'package:get_it/get_it.dart' show GetIt;
import 'package:sqflite/sqflite.dart' show Database;
import 'package:gamer_reflection/storage/rdb/repository/command/todo.dart'
    show IRepositoryTodoCommand;
import 'package:gamer_reflection/storage/rdb/driver/sqlite.dart'
    show DBConnection;

/// Request: やることリスト
class RequestTodo {
  final IRepositoryTodoCommand rTodo = GetIt.I<IRepositoryTodoCommand>();

  /// 新規追加: Todo
  Future<void> insertTodo(int reflectionId, int reflectionGroupId) async {
    final Database db = GetIt.I<DBConnection>().db;
    await rTodo.insertTodo(db, reflectionId, reflectionGroupId);
  }

  /// 削除: Todo
  Future<void> deleteTodo(int reflectionId) async {
    final Database db = GetIt.I<DBConnection>().db;
    await rTodo.deleteTodoById(db, reflectionId);
  }
}
