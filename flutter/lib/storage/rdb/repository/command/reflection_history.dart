import 'package:sqflite/sqflite.dart' show Database;
import 'package:injectable/injectable.dart' show Injectable;
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
  ) async {}
}
