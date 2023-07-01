import 'package:sqflite/sqflite.dart' show Database, ConflictAlgorithm;
import 'package:injectable/injectable.dart' show Injectable;
import 'package:gamer_reflection/storage/rdb/model/reflection_history.dart'
    show ModelReflectionHistory, tableNameReflectionHistory;
import 'package:gamer_reflection/modules/type/reflection.dart'
    show ReflectionType;
import 'package:gamer_reflection/domain/database/reflection_history.dart'
    show DomainReflectionHistory;

/// Interface: RepositoryReflectionHistoryCommand
abstract class IRepositoryReflectionHistoryCommand {
  Future<void> insertAndDeleteReflectionHistory(
    Database db,
    List<DomainReflectionHistory> historys,
  );
}

/// Repository: 振り返り履歴
@Injectable(as: IRepositoryReflectionHistoryCommand)
class RepositoryReflectionHistoryCommand
    extends IRepositoryReflectionHistoryCommand {
  /// 追加と削除: 振り返り履歴
  @override
  Future<void> insertAndDeleteReflectionHistory(
    Database db,
    List<DomainReflectionHistory> historys,
  ) async {
    // /// 新規登録
    // final ModelReflectionHistory reflectionHistory = ModelReflectionHistory(
    //   reflectionGroupId: groupId,
    //   reflectionType: isGood ? 1 : 2,
    //   text: text,
    //   count: count,
    //   date: DateTime.now(),
    // );

    // await db.insert(
    //   tableNameReflectionHistory,
    //   reflectionHistory.toMap(),
    //   conflictAlgorithm: ConflictAlgorithm.replace,
    // );
  }
}
