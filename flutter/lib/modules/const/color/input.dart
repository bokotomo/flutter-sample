import 'package:flutter/material.dart' show Color;
import 'package:gamer_reflection/modules/const/color/colors.dart' show blue;

class ColorInput {
  const ColorInput({
    required this.input,
    required this.inputBorder,
    required this.inputHintText,
    required this.inputBorderFocus,
    required this.inputBorderError,
    required this.inputErrorText,
  });

  final Color input;
  final Color inputBorder;
  final Color inputHintText;
  final Color inputBorderFocus;
  final Color inputBorderError;
  final Color inputErrorText;
}

ColorInput colorInput(bool isDark) {
  return ColorInput(
    input:
        isDark ? ConstantColorInputDark.input : ConstantColorInputLight.input,
    inputBorder: isDark
        ? ConstantColorInputDark.inputBorder
        : ConstantColorInputLight.inputBorder,
    inputHintText: isDark
        ? ConstantColorInputDark.inputHintText
        : ConstantColorInputLight.inputHintText,
    inputBorderFocus: isDark
        ? ConstantColorInputDark.inputBorderFocus
        : ConstantColorInputLight.inputBorderFocus,
    inputBorderError: isDark
        ? ConstantColorInputDark.inputBorderError
        : ConstantColorInputLight.inputBorderError,
    inputErrorText: isDark
        ? ConstantColorInputDark.inputErrorText
        : ConstantColorInputLight.inputErrorText,
  );
}

/// 用途ごとに色を定義する: input: ダークモード
class ConstantColorInputDark {
  ConstantColorInputDark._();

  /// inputの背景色
  static const Color input = Color.fromARGB(255, 24, 25, 31);

  /// inputの枠線色
  static const Color inputBorder = blue;

  /// prefixの文字色
  static const Color inputHintText = Color.fromARGB(70, 255, 255, 255);

  /// inputの枠線色フォーカス
  static const Color inputBorderFocus = blue;

  /// inputの枠線色エラーテキスト
  static const Color inputBorderError = Color.fromARGB(255, 118, 63, 63);

  /// inputのエラーテキスト色
  static const Color inputErrorText = Color.fromARGB(255, 255, 223, 223);
}

/// 用途ごとに色を定義する: input: ダークモード
class ConstantColorInputLight {
  ConstantColorInputLight._();

  /// inputの背景色
  static const Color input = Color.fromARGB(255, 24, 25, 31);

  /// inputの枠線色
  static const Color inputBorder = blue;

  /// prefixの文字色
  static const Color inputHintText = Color.fromARGB(70, 255, 255, 255);

  /// inputの枠線色フォーカス
  static const Color inputBorderFocus = blue;

  /// inputの枠線色エラーテキスト
  static const Color inputBorderError = Color.fromARGB(255, 118, 63, 63);

  /// inputのエラーテキスト色
  static const Color inputErrorText = Color.fromARGB(255, 255, 223, 223);
}
