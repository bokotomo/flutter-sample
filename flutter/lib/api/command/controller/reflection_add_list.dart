import 'package:get_it/get_it.dart' show GetIt;
import 'package:sqflite/sqflite.dart' show Database;
import 'package:gamer_reflection/storage/rdb/driver/sqlite.dart'
    show DBConnection;
import 'package:gamer_reflection/domain/common/reflection_added.dart'
    show DomainReflectionAdded;
import 'package:gamer_reflection/storage/rdb/repository/command/reflection.dart'
    show IRepositoryReflectionCommand;
import 'package:gamer_reflection/storage/rdb/repository/command/reflection_history_group.dart'
    show IRepositoryReflectionHistoryGroupCommand;
import 'package:gamer_reflection/storage/rdb/repository/command/game.dart'
    show IRepositoryGameCommand;

/// Request: ReflectionAddList
class RequestReflectionAddList {
  final IRepositoryReflectionCommand rReflection =
      GetIt.I<IRepositoryReflectionCommand>();
  final IRepositoryReflectionHistoryGroupCommand rReflectionHistoryGroup =
      GetIt.I<IRepositoryReflectionHistoryGroupCommand>();
  final IRepositoryGameCommand rGame = GetIt.I<IRepositoryGameCommand>();

  /// 新規追加: Reflection
  Future<void> createReflection(
    List<DomainReflectionAdded> reflections,
    int groupId,
    int exp,
  ) async {
    // todo: 複数のDB処理はトランザクションにする
    final Database db = GetIt.I<DBConnection>().db;
    // 振り返りを追加
    await rReflection.insertReflection(
      db,
      reflections,
      groupId,
    );
    // 振り返り履歴を追加
    await rReflectionHistoryGroup.insertAndDeleteReflectionHistoryGroup(
      db,
      reflections,
      groupId,
    );
    // 経験値の追加
    await rGame.updateAddExp(
      db,
      exp,
    );
  }
}
