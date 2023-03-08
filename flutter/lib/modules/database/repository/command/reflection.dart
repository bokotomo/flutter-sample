import 'package:sqflite/sqflite.dart';
import 'package:injectable/injectable.dart' show Injectable;
import 'package:gamer_reflection/modules/database/model/reflection.dart'
    show ModelReflection, tableNameReflection;

/// Interface: RepositoryReflectionCommand
abstract class IRepositoryReflectionCommand {
  Future<void> insertReflection(Database db, String text);
  Future<void> updateReflectionById(Database db, int id, ModelReflection model);
  Future<void> deleteReflectionById(Database db, int id);
}

/// Repository: 振り返り
@Injectable(as: IRepositoryReflectionCommand)
class RepositoryReflectionCommand extends IRepositoryReflectionCommand {
  /// 追加: 振り返り
  @override
  Future<void> insertReflection(Database db, String text) async {
    /// idにする
    final List<Map<String, Object?>> res = await db.query(
      tableNameReflection,
      columns: ['id', 'count'],
      where: '"text" = ?',
      whereArgs: [text],
    );

    if (res.isEmpty) {
      /// 新規登録
      final ModelReflection reflection = ModelReflection(
        reflectionGroupId: 1,
        reflectionType: 1,
        text: text,
        detail: "",
        count: 1,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      await db.insert(
        tableNameReflection,
        reflection.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } else {
      /// まだ登録されてない
      final int id = res.first['id'] as int;
      final int count = res.first['count'] as int;

      final ModelReflection reflection = ModelReflection(
        reflectionGroupId: 0,
        reflectionType: 0,
        text: "",
        detail: "",
        count: count + 1,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      await db.update(
        tableNameReflection,
        reflection.toMapCount(),
        where: 'id = ?',
        whereArgs: [id],
      );
    }
  }

  /// 更新: 指定したIDの振り返り
  @override
  Future<void> updateReflectionById(
    Database db,
    int id,
    ModelReflection model,
  ) async {
    final Map<String, Object?> map = {}
      ..addAll(model.toMapText())
      ..addAll(model.toMapDetail());

    await db.update(
      tableNameReflection,
      map,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  /// 削除: 指定したIDの振り返り
  @override
  Future<void> deleteReflectionById(Database db, int id) async {
    await db.delete(
      tableNameReflection,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
