import 'package:sqflite/sqflite.dart' show Database;
import 'package:injectable/injectable.dart' show Injectable;
import 'package:gamer_reflection/storage/rdb/model/game.dart'
    show ModelGame, tableNameGame;

/// Interface: RepositoryGameCommand
abstract class IRepositoryGameCommand {
  Future<void> updateAddExp(Database db, int exp);
}

/// Repository: 振り返り
@Injectable(as: IRepositoryGameCommand)
class RepositoryGameCommand extends IRepositoryGameCommand {
  /// 更新: 経験値を加算する
  @override
  Future<void> updateAddExp(Database db, int exp) async {
    // 既存のデータ取得
    final List<Map<String, Object?>> res = await db.query(
      tableNameGame,
      columns: ['*'],
    );
    final int resId = res.first['id'] as int;
    final int resExp = res.first['exp'] as int;

    final model = ModelGame(
      exp: resExp + exp,
      updatedAt: DateTime.now(),
    );

    await db.update(
      tableNameGame,
      model.toMap(),
      where: 'id = ?',
      whereArgs: [resId],
    );
  }
}
