import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;
import 'package:gamer_reflection/modules/const/rank/rank_exp.dart'
    show ConstantRankExp;

/// ランクシステムのマスター情報
class ConstantRankSystem {
  const ConstantRankSystem({
    required this.index,
    required this.rank,
    required this.prevExp,
    required this.nextExp,
  });
  final int index;
  final String rank;
  final int prevExp;
  final int? nextExp;
}

/// ランクシステムのマスター情報
List<ConstantRankSystem> constantRankSystems(AppLocalizations i18n) {
  return [
    ConstantRankSystem(
      index: 0,
      rank: i18n.commonRankBronze,
      prevExp: ConstantRankExp.bronze,
      nextExp: ConstantRankExp.silver,
    ),
    ConstantRankSystem(
      index: 1,
      rank: i18n.commonRankSilver,
      prevExp: ConstantRankExp.silver,
      nextExp: ConstantRankExp.gold,
    ),
    ConstantRankSystem(
      index: 2,
      rank: i18n.commonRankGold,
      prevExp: ConstantRankExp.gold,
      nextExp: ConstantRankExp.platinum3,
    ),
    ConstantRankSystem(
      index: 3,
      rank: i18n.commonRankPlatinum3,
      prevExp: ConstantRankExp.platinum3,
      nextExp: ConstantRankExp.platinum2,
    ),
    ConstantRankSystem(
      index: 4,
      rank: i18n.commonRankPlatinum2,
      prevExp: ConstantRankExp.platinum2,
      nextExp: ConstantRankExp.platinum1,
    ),
    ConstantRankSystem(
      index: 5,
      rank: i18n.commonRankPlatinum1,
      prevExp: ConstantRankExp.platinum1,
      nextExp: ConstantRankExp.diamond3,
    ),
    ConstantRankSystem(
      index: 6,
      rank: i18n.commonRankDiamond3,
      prevExp: ConstantRankExp.diamond3,
      nextExp: ConstantRankExp.diamond2,
    ),
    ConstantRankSystem(
      index: 7,
      rank: i18n.commonRankDiamond2,
      prevExp: ConstantRankExp.diamond2,
      nextExp: ConstantRankExp.diamond1,
    ),
    ConstantRankSystem(
      index: 8,
      rank: i18n.commonRankDiamond1,
      prevExp: ConstantRankExp.diamond1,
      nextExp: null,
    ),
  ];
}
