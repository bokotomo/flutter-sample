import 'package:gamer_reflection/storage/rdb/model/game.dart' show ModelGame;
import 'package:gamer_reflection/domain/reflection/game.dart'
    show DomainReflectionGame;
import 'package:gamer_reflection/modules/const/rank/rank_system.dart'
    show constantRankSystems;

/// Adapter Domain: Reflection
class AdapterReflection {
  /// ゲーミフィケーション
  DomainReflectionGame domainGame(ModelGame model) {
    final currentRank = constantRankSystems
        .firstWhere((e) => e.prevExp <= model.exp && model.exp < e.nextExp);

    /// ドメインに変換
    return DomainReflectionGame(
      exp: model.exp,
      nextExp: currentRank.nextExp,
      rank: currentRank.rank,
    );
  }
}
