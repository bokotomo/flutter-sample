import 'package:flutter/material.dart' show Color;

class ColorGauge {
  const ColorGauge({
    required this.gauge,
  });

  final Color gauge;
}

/// 用途ごとに色を定義する: ゲージ: ダークモード
class ConstantColorGauge {
  ConstantColorGauge._();

  /// ゲージ: ゲージ色
  static const Color gauge = Color.fromARGB(255, 40, 88, 221);

  /// ゲージ: 背景色
  static const Color background = Color.fromARGB(255, 197, 197, 213);
}
