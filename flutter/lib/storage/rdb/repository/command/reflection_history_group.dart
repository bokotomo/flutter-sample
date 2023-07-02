import 'package:sqflite/sqflite.dart' show Database, ConflictAlgorithm, Batch;
import 'package:injectable/injectable.dart' show Injectable;
import 'package:gamer_reflection/storage/rdb/model/reflection_history_group.dart'
    show ModelReflectionHistoryGroup, tableNameReflectionHistoryGroup;
import 'package:gamer_reflection/storage/rdb/model/reflection_history.dart'
    show ModelReflectionHistory, tableNameReflectionHistory;
import 'package:gamer_reflection/domain/common/reflection_added.dart'
    show DomainReflectionAdded;
import 'package:gamer_reflection/modules/type/reflection.dart'
    show ReflectionType;

/// Interface: RepositoryReflectionHistoryGroupCommand
abstract class IRepositoryReflectionHistoryGroupCommand {
  Future<void> insertAndDeleteReflectionHistoryGroup(
    Database db,
    List<DomainReflectionAdded> reflections,
    int reflectionGroupId,
  );
}

/// Repository: 振り返り履歴グループ
@Injectable(as: IRepositoryReflectionHistoryGroupCommand)
class RepositoryReflectionHistoryGroupCommand
    extends IRepositoryReflectionHistoryGroupCommand {
  /// 追加と削除: 振り返り履歴グループ
  /// 10を超える場合は削除する
  @override
  Future<void> insertAndDeleteReflectionHistoryGroup(
    Database db,
    List<DomainReflectionAdded> reflections,
    int reflectionGroupId,
  ) async {
    // トランザクション
    db.transaction((txn) async {
      final resCount = await txn.rawQuery(
          'SELECT COUNT(*) as count FROM $tableNameReflectionHistoryGroup');
      final count = resCount.first['count'] as int;

      // 10個以上は保存しないので削除
      if (count >= 5) {
        final List<Map<String, Object?>> resLastRecord = await txn.query(
          tableNameReflectionHistoryGroup,
          columns: ['id'],
          orderBy: 'id ASC',
          limit: 1,
        );
        final id = resLastRecord.first['id'] as int;
        await txn.delete(
          tableNameReflectionHistoryGroup,
          where: 'id = ?',
          whereArgs: [id],
        );
      }

      /// 新規登録 振り返り履歴グループ
      final ModelReflectionHistoryGroup reflectionHistory =
          ModelReflectionHistoryGroup(
        reflectionGroupId: reflectionGroupId,
        date: DateTime.now(),
      );

      final reflectionHistoryGroupId = await txn.insert(
        tableNameReflectionHistoryGroup,
        reflectionHistory.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );

      /// 新規登録 振り返り履歴
      List<ModelReflectionHistory> historys = reflections.map((e) {
        return ModelReflectionHistory(
          reflectionHistoryGroupId: reflectionHistoryGroupId,
          text: e.text,
          count: e.count,
          reflectionType: e.reflectionType == ReflectionType.good ? 1 : 2,
        );
      }).toList();

      Batch batch = txn.batch();
      for (var history in historys) {
        batch.insert(
          tableNameReflectionHistory,
          history.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
      }
      await batch.commit(noResult: true);
    });
  }
}
