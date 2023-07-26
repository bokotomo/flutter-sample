import 'package:flutter/material.dart' show Color;

class ColorGauge {
  const ColorGauge({
    required this.gauge,
    required this.background,
  });

  final Color gauge;
  final Color background;
}

ColorGauge colorGauge(bool isDark) {
  return ColorGauge(
    gauge:
        isDark ? ConstantColorGaugeDark.gauge : ConstantColorGaugeLight.gauge,
    background: isDark
        ? ConstantColorGaugeDark.background
        : ConstantColorGaugeLight.background,
  );
}

/// 用途ごとに色を定義する: ゲージ: ダークモード
class ConstantColorGaugeDark {
  ConstantColorGaugeDark._();

  /// ゲージ: ゲージ色
  static const Color gauge = Color.fromARGB(255, 40, 88, 221);

  /// ゲージ: 背景色
  static const Color background = Color.fromARGB(255, 197, 197, 213);
}

/// 用途ごとに色を定義する: ゲージ: ライトモード
class ConstantColorGaugeLight {
  ConstantColorGaugeLight._();

  /// ゲージ: ゲージ色
  static const Color gauge = Color.fromARGB(255, 40, 88, 221);

  /// ゲージ: 背景色
  static const Color background = Color.fromARGB(255, 197, 197, 213);
}
