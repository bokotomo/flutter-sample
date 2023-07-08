import 'package:gamer_reflection/modules/const/rank/rank.dart'
    show ConstantRank;
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
List<ConstantRankSystem> constantRankSystems = [
  const ConstantRankSystem(
    index: 0,
    rank: ConstantRank.bronze,
    prevExp: ConstantRankExp.bronze,
    nextExp: ConstantRankExp.silver,
  ),
  const ConstantRankSystem(
    index: 1,
    rank: ConstantRank.silver,
    prevExp: ConstantRankExp.silver,
    nextExp: ConstantRankExp.gold,
  ),
  const ConstantRankSystem(
    index: 2,
    rank: ConstantRank.gold,
    prevExp: ConstantRankExp.gold,
    nextExp: ConstantRankExp.platinum3,
  ),
  const ConstantRankSystem(
    index: 3,
    rank: ConstantRank.platinum3,
    prevExp: ConstantRankExp.platinum3,
    nextExp: ConstantRankExp.platinum2,
  ),
  const ConstantRankSystem(
    index: 4,
    rank: ConstantRank.platinum2,
    prevExp: ConstantRankExp.platinum2,
    nextExp: ConstantRankExp.platinum1,
  ),
  const ConstantRankSystem(
    index: 5,
    rank: ConstantRank.platinum1,
    prevExp: ConstantRankExp.platinum1,
    nextExp: ConstantRankExp.diamond3,
  ),
  const ConstantRankSystem(
    index: 6,
    rank: ConstantRank.diamond3,
    prevExp: ConstantRankExp.diamond3,
    nextExp: ConstantRankExp.diamond2,
  ),
  const ConstantRankSystem(
    index: 7,
    rank: ConstantRank.diamond2,
    prevExp: ConstantRankExp.diamond2,
    nextExp: ConstantRankExp.diamond1,
  ),
  const ConstantRankSystem(
    index: 8,
    rank: ConstantRank.diamond1,
    prevExp: ConstantRankExp.diamond1,
    nextExp: null,
  ),
];
