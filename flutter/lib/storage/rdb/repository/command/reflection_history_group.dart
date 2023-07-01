import 'package:sqflite/sqflite.dart' show Database, ConflictAlgorithm;
import 'package:injectable/injectable.dart' show Injectable;
import 'package:gamer_reflection/storage/rdb/model/reflection_history_group.dart'
    show ModelReflectionHistoryGroup, tableNameReflectionHistoryGroup;

/// Interface: RepositoryReflectionHistoryGroupCommand
abstract class IRepositoryReflectionHistoryGroupCommand {
  Future<void> insertAndDeleteReflectionHistoryGroup(Database db, int groupId);
}

/// Repository: 振り返り履歴グループ
@Injectable(as: IRepositoryReflectionHistoryGroupCommand)
class RepositoryReflectionHistoryGroupCommand
    extends IRepositoryReflectionHistoryGroupCommand {
  /// 追加と削除: 振り返り履歴グループ
  /// 30を超える場合は削除する
  @override
  Future<void> insertAndDeleteReflectionHistoryGroup(
    Database db,
    int groupId,
  ) async {
    /// idにする
    final resCount = await db.rawQuery(
        'SELECT COUNT(*) as count FROM $tableNameReflectionHistoryGroup');
    final count = resCount.first['count'] as int;
    print(resCount);

    // 30個以上は保存しないので削除
    if (count > 30) {
      final List<Map<String, Object?>> resLast = await db.query(
        tableNameReflectionHistoryGroup,
        columns: ['id'],
        orderBy: 'id DESC',
        limit: 1,
      );
      final id = resLast.first['id'] as int;
      print(resLast);
      // await db.delete(
      //   tableNameReflectionHistory,
      //   where: 'id = ?',
      //   whereArgs: [a],
      // );
    }

    // /// 新規登録
    // final ModelReflectionHistoryGroup reflectionHistory =
    //     ModelReflectionHistoryGroup(
    //   reflectionGroupId: groupId,
    //   date: DateTime.now(),
    // );

    // await db.insert(
    //   tableNameReflectionHistoryGroup,
    //   reflectionHistory.toMap(),
    //   conflictAlgorithm: ConflictAlgorithm.replace,
    // );
  }
}
