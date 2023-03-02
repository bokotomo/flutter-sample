import 'package:flutter/material.dart';

const _white = Colors.white;
const _darkBlueLittle = Color.fromARGB(239, 49, 43, 74);
const _darkBlue = Color.fromARGB(255, 14, 9, 32);
const _grayDark = Color.fromARGB(255, 51, 57, 67);
const _grayLight = Color.fromARGB(255, 81, 86, 98);

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

  /// ボックスの背景色
  static const Color box = _grayDark;

  /// ボックスの枠線色
  static const Color boxBorder = _grayLight;

  /// タスクリストの矢印の色
  static const Color taskListArrow = Color.fromARGB(55, 255, 255, 255);
}

/// 用途ごとに色を定義する: input
class ConstantColorInput {
  ConstantColorInput._();

  /// inputの背景色
  static const Color input = Color.fromARGB(255, 24, 25, 31);

  /// inputの枠線色
  static const Color inputBorder = Color.fromARGB(255, 45, 24, 114);

  /// prefixの文字色
  static const Color inputHintText = Color.fromARGB(70, 255, 255, 255);

  /// inputの枠線色フォーカス
  static const Color inputBorderFocus = Color.fromARGB(255, 57, 30, 145);
}

/// 用途ごとに色を定義する: タグの色
class ConstantColorTextTag {
  ConstantColorTextTag._();

  /// タグの背景色
  static const Color textTagBackground = _darkBlue;

  /// タグの色 枠線 red
  static const Color textTagRedBorder = Color.fromARGB(255, 201, 98, 141);

  /// タグの色 枠線 purple
  static const Color textTagPurpleBorder = Color.fromARGB(255, 152, 83, 194);

  /// タグの色 枠線 blue
  static const Color textTagBlueBorder = Color.fromARGB(255, 88, 111, 186);

  /// タグの色 枠線 gray
  static const Color textTagGrayBorder = Color.fromARGB(255, 81, 86, 98);

  /// タグの色 red
  static const Color textTagRedText = Color.fromARGB(255, 234, 151, 186);

  /// タグの色 purple
  static const Color textTagPurpleText = Color.fromARGB(255, 202, 151, 234);

  /// タグの色 blue
  static const Color textTagBlueText = Color.fromARGB(255, 151, 170, 234);

  /// タグの色 gray
  static const Color textTagGrayText = _white;

  /// タグの色 背景 gray
  static const Color textTagGrayBackGround = Color.fromARGB(255, 51, 57, 67);
}

/// 用途ごとに色を定義する: ボタンの色
class ConstantColorButton {
  ConstantColorButton._();

  /// ボタンの背景色
  static const Color button = Color.fromARGB(255, 65, 71, 132);

  /// ボタンの枠線色
  static const Color buttonBorder = Color.fromARGB(255, 86, 96, 219);

  /// 完了ボタンの背景色
  static const Color buttonDone = Color.fromARGB(255, 85, 129, 91);

  /// 完了ボタンの枠線色
  static const Color buttonDoneBorder = Color.fromARGB(255, 92, 159, 105);

  /// キャンセルボタンの背景色
  static const Color buttonCancel = Color.fromARGB(255, 94, 94, 103);

  /// キャンセルボタンの枠線色
  static const Color buttonCancelBorder = Color.fromARGB(255, 117, 121, 163);

  /// タスク一覧ボタンの背景色: 濃い
  static const Color buttonTaskList = Color.fromARGB(255, 26, 27, 31);

  /// タスク一覧ボタンの背景色: 薄い
  static const Color buttonTaskListThin = Color.fromARGB(255, 43, 47, 56);

  /// タスク一覧ボタンの枠線色
  static const Color buttonTaskListBorder = Color.fromARGB(255, 93, 98, 116);
}
