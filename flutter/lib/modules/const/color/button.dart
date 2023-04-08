import 'package:flutter/material.dart' show Color;
import 'package:gamer_reflection/modules/const/color/colors.dart' show darkBlue;

/// 用途ごとに色を定義する: ボタンの色
class ConstantColorButton {
  ConstantColorButton._();

  /// ボタンの背景色
  static const Color button = Color.fromARGB(255, 37, 39, 93);

  /// ボタンの枠線色
  static const Color buttonBorder = Color.fromARGB(255, 49, 60, 199);

  /// 完了ボタンの背景色
  static const Color buttonDone = Color.fromARGB(255, 85, 129, 91);

  /// 完了ボタンの枠線色
  static const Color buttonDoneBorder = Color.fromARGB(255, 92, 159, 105);

  /// キャンセルボタンの背景色
  static const Color buttonCancel = Color.fromARGB(255, 94, 94, 103);

  /// キャンセルボタンの枠線色
  static const Color buttonCancelBorder = Color.fromARGB(255, 117, 121, 163);

  /// 期間選択ボタンの背景色
  static const Color buttonPeriod = darkBlue;

  /// 期間選択ボタンの背景色
  static const Color buttonPeriodActive = Color.fromARGB(255, 53, 60, 144);

  /// 期間選択ボタンの枠線色
  static const Color buttonPeriodBorder = Color.fromARGB(255, 69, 78, 177);

  /// タスク一覧ボタンの背景色: 濃い
  static const Color buttonTaskList = Color.fromARGB(255, 26, 27, 31);

  /// タスク一覧ボタンの背景色: 薄い
  static const Color buttonTaskListThin = Color.fromARGB(255, 43, 47, 56);

  /// タスク一覧ボタンの枠線色
  static const Color buttonTaskListBorder = Color.fromARGB(255, 67, 69, 82);
}
