import 'package:get_it/get_it.dart' show GetIt;
import 'package:sqflite/sqflite.dart' show Database;
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;
import 'package:gamer_reflection/domain/common/reflection_group.dart'
    show DomainReflectionGroup;
import 'package:gamer_reflection/domain/reflection/game.dart'
    show DomainReflectionGame;
import 'package:gamer_reflection/storage/rdb/repository/query/reflection_group.dart'
    show IRepositoryReflectionGroupQuery;
import 'package:gamer_reflection/storage/rdb/repository/query/game.dart'
    show IRepositoryGameQuery;
import 'package:gamer_reflection/storage/rdb/driver/sqlite.dart'
    show DBConnection;
import 'package:gamer_reflection/modules/adapter/reflection_group.dart'
    show AdapterReflectionGroup;
import 'package:gamer_reflection/modules/adapter/reflection.dart'
    show AdapterReflection;

/// データ取得: 振り返りページ
class FetchReflectionPage {
  final IRepositoryReflectionGroupQuery repositoryReflectionGroup =
      GetIt.I<IRepositoryReflectionGroupQuery>();
  final IRepositoryGameQuery repositoryGame = GetIt.I<IRepositoryGameQuery>();

  /// 取得: 振り返りグループ一覧
  Future<List<DomainReflectionGroup>> fetchReflectionGroups() async {
    final Database db = GetIt.I<DBConnection>().db;
    final models = await repositoryReflectionGroup.getReflectionGroups(db);
    return AdapterReflectionGroup().domainReflectionGroups(models);
  }

  /// 取得: ゲーミフィケーション情報
  Future<DomainReflectionGame> fetchGame(AppLocalizations i18n) async {
    final Database db = GetIt.I<DBConnection>().db;
    final model = await repositoryGame.getGame(db);
    return AdapterReflection().domainGame(model, i18n);
  }
}
