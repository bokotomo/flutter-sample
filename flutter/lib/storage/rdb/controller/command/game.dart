import 'package:get_it/get_it.dart' show GetIt;
import 'package:sqflite/sqflite.dart' show Database;
import 'package:gamer_reflection/storage/rdb/repository/command/game.dart'
    show IRepositoryGameCommand;
import 'package:gamer_reflection/storage/rdb/driver/sqlite.dart'
    show DBConnection;

/// Request: Game
class RequestGame {
  final IRepositoryGameCommand rGame = GetIt.I<IRepositoryGameCommand>();

  /// 更新: 経験値を加算
  Future<void> updateAddExp(int exp) async {
    final Database db = GetIt.I<DBConnection>().db;
    await rGame.updateAddExp(db, exp);
  }
}
