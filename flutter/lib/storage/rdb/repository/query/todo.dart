import 'package:sqflite/sqflite.dart' show Database;
import 'package:injectable/injectable.dart' show Injectable;
import 'package:gamer_reflection/storage/rdb/model/todo.dart'
    show tableNameTodo;
import 'package:gamer_reflection/storage/rdb/model/reflection.dart'
    show tableNameReflection, ModelReflection;

/// Interface: RepositoryTodoQuery
abstract class IRepositoryTodoQuery {
  Future<List<ModelReflection>> getTodos(Database db, int groupId);
  Future<bool> todoExist(Database db, int reflectionId);
}

/// Repository: やることリスト
@Injectable(as: IRepositoryTodoQuery)
class RepositoryTodoQuery extends IRepositoryTodoQuery {
  /// 取得: やること一覧
  @override
  Future<List<ModelReflection>> getTodos(
    Database db,
    int groupId,
  ) async {
    final List<Map<String, Object?>> res = await db.rawQuery(
      'SELECT * FROM ? LEFT JOIN reflection WHERE reflection.reflection_group_id=1 LIMIT 150',
      [
        tableNameTodo,
        // tableNameReflection,
        // tableNameReflection,
        // groupId,
        // 150,
      ],
    );
    // final List<Map<String, Object?>> res = await db.rawQuery(
    //   'SELECT * FROM todo LEFT JOIN reflection WHERE reflection.reflection_group_id=1 LIMIT 150',
    // );
    print(res);

    return List.generate(res.length, (i) {
      return ModelReflection(
        id: res[i]['reflection_id'] as int,
        reflectionGroupId: res[i]['reflection_group_id'] as int,
        reflectionType: res[i]['reflection_type'] as int,
        text: res[i]['text'] as String,
        detail: res[i]['detail'] as String,
        count: res[i]['count'] as int,
        updatedAt:
            DateTime.tryParse(res[i]['updated_at'] as String) ?? DateTime.now(),
        createdAt:
            DateTime.tryParse(res[i]['created_at'] as String) ?? DateTime.now(),
      );
    });
  }

  /// 取得: やることに追加されているか
  @override
  Future<bool> todoExist(
    Database db,
    int reflectionId,
  ) async {
    final List<Map<String, Object?>> res = await db.query(
      tableNameTodo,
      where: '"reflection_id" = ?',
      whereArgs: [reflectionId],
      columns: ['id'],
    );

    return res.isNotEmpty;
  }
}
