import 'package:sqflite/sqflite.dart' show Database, ConflictAlgorithm;
import 'package:injectable/injectable.dart' show Injectable;
import 'package:gamer_reflection/modules/database/model/reflection_group.dart'
    show ModelReflectionGroup, tableNameReflection;

/// Interface: IRepositoryReflectionGroupCommand
abstract class IRepositoryReflectionGroupCommand {
  Future<void> insertReflection(Database db, String name);
  Future<void> updateReflectionGroupNameById(Database db, int id, String name);
  // Future<void> deleteReflectionById(Database db, int id);
}

/// Repository: 振り返りグループ
@Injectable(as: IRepositoryReflectionGroupCommand)
class RepositoryReflectionGroupCommand
    extends IRepositoryReflectionGroupCommand {
  /// 追加: 振り返りグループ
  @override
  Future<void> insertReflection(Database db, String name) async {
    /// 新規登録
    final ModelReflectionGroup reflectionGroup = ModelReflectionGroup(
      name: name,
      createdAt: DateTime.now(),
    );

    await db.insert(
      tableNameReflection,
      reflectionGroup.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  /// 更新: 振り返りグループ名
  @override
  Future<void> updateReflectionGroupNameById(
    Database db,
    int id,
    String name,
  ) async {
    final ModelReflectionGroup reflectionGroup = ModelReflectionGroup(
      name: name,
      createdAt: DateTime.now(),
    );
    final Map<String, Object?> map = {}..addAll(reflectionGroup.toMap());

    await db.update(
      tableNameReflection,
      map,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // /// 削除: 指定したIDの振り返り
  // @override
  // Future<void> deleteReflectionById(Database db, int id) async {
  //   await db.delete(
  //     tableNameReflection,
  //     where: 'id = ?',
  //     whereArgs: [id],
  //   );
  // }
}
