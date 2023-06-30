/// ランク
/// 経験値は350exp
/// 3ヶ月に1回1ランク下がる
class ConstantRankExp {
  ConstantRankExp._();

  /// ブロンズ
  /// 初期ランク
  static const int bronze = 0;

  /// シルバー
  /// +3回 1日で到達
  static const int silver = 0 + 1000;

  /// ゴールド
  /// +3回 2日で到達
  static const int gold = 1000 + 1000;

  /// プラチナ3
  /// +4回 3日で到達
  static const int platinum3 = 2000 + 1300;

  /// プラチナ2
  /// +4回 4日で到達
  static const int platinum2 = 3300 + 1300;

  /// プラチナ1
  /// +4回 5日で到達
  static const int platinum1 = 4600 + 1300;

  /// ダイヤ3
  /// +6回 7日で到達
  static const int diamond3 = 5900 + 2000;

  /// ダイヤ2
  /// +6回 9日で到達
  static const int diamond2 = 7900 + 2000;

  /// ダイヤ1
  /// +6回 11日で到達
  static const int diamond1 = 9900 + 2000;
}
