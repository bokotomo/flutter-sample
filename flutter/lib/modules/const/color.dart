import 'package:flutter/material.dart';

const _darkBlueLittle = Color.fromARGB(239, 49, 43, 74);
const _darkBlue = Color.fromARGB(255, 14, 9, 32);
const _white = Colors.white;

/// 用途ごとに色を定義する
class ConstantColor {
  ConstantColor._();

  /// バーの背景色
  static const Color header = _darkBlueLittle;

  /// フッターの背景色
  static const Color footer = _darkBlueLittle;

  /// コンテンツの背景色
  static const Color content = _darkBlue;

  /// 基本的な文字色
  static const Color text = _white;

  /// 薄い文字
  static const Color textOpacity = Color.fromARGB(120, 255, 255, 255);

  /// ボタンの背景色
  static const Color button = Color.fromARGB(255, 55, 55, 196);

  /// ボタンの枠線色
  static const Color buttoBorder = Color.fromARGB(255, 93, 93, 228);

  /// inputの背景色
  static const Color input = Color.fromARGB(255, 24, 25, 31);

  /// inputの枠線色
  static const Color inputBorder = Color.fromARGB(255, 45, 24, 114);

  /// prefixの文字色
  static const Color inputHintText = Color.fromARGB(70, 255, 255, 255);

  /// inputの枠線色フォーカス
  static const Color inputBorderFocus = Color.fromARGB(255, 57, 30, 145);
}
