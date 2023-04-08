import 'package:flutter/material.dart' show Color;

/// 用途ごとに色を定義する: input
class ConstantColorInput {
  ConstantColorInput._();

  /// inputの背景色
  static const Color input = Color.fromARGB(255, 24, 25, 31);

  /// inputの枠線色
  static const Color inputBorder = Color.fromARGB(255, 41, 48, 134);

  /// prefixの文字色
  static const Color inputHintText = Color.fromARGB(70, 255, 255, 255);

  /// inputの枠線色フォーカス
  static const Color inputBorderFocus = Color.fromARGB(255, 41, 48, 134);

  /// inputの枠線色エラーテキスト
  static const Color inputBorderError = Color.fromARGB(255, 118, 63, 63);

  /// inputのエラーテキスト色
  static const Color inputErrorText = Color.fromARGB(255, 255, 223, 223);
}
