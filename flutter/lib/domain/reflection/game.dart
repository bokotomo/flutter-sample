import 'package:gamer_reflection/domain/site/game.dart' show DomainGameEXP;

/// ドメイン: 振り返りページ ゲーミフィケーション
class DomainReflectionGame implements DomainGameEXP {
  const DomainReflectionGame({
    required this.exp,
    required this.nextExp,
    required this.rank,
  });

  /// 経験値
  @override
  final int exp;

  /// 次のランクに上がる経験値
  final int nextExp;

  /// 現在のランク
  final String rank;
}
