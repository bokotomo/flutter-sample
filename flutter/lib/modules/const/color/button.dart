import 'package:flutter/material.dart' show Color;
import 'package:gamer_reflection/modules/const/color/colors.dart' show darkBlue;

/// 用途ごとに色を定義する: ボタンの色
class ConstantColorButton {
  ConstantColorButton._();

  /// ボタン: 背景色
  static const Color button = Color.fromARGB(255, 37, 39, 93);

  /// ボタン: 枠線色
  static const Color buttonBorder = Color.fromARGB(255, 49, 60, 199);

  /// 薄いボタン: 背景色
  static const Color buttonThin = Color.fromARGB(255, 8, 8, 13);

  /// 薄いボタン: 枠線色
  static const Color buttonThinBorder = Color.fromARGB(255, 35, 39, 77);

  /// 薄いボタン: アクティブ状態の背景色
  static const Color buttonThinActive = Color.fromARGB(255, 43, 47, 56);

  /// 薄いボタン: アクティブ状態の枠線色
  static const Color buttonThinActiveBorder = Color.fromARGB(255, 68, 79, 118);

  /// 完了ボタン: 背景色
  static const Color buttonDone = Color.fromARGB(255, 85, 129, 91);

  /// 完了ボタン: 枠線色
  static const Color buttonDoneBorder = Color.fromARGB(255, 92, 159, 105);

  /// キャンセルボタン: 背景色
  static const Color buttonCancel = Color.fromARGB(255, 94, 94, 103);

  /// キャンセルボタン: 枠線色
  static const Color buttonCancelBorder = Color.fromARGB(255, 122, 122, 131);

  /// ラジオボタン: 背景色
  static const Color buttonRadio = Color.fromARGB(255, 29, 33, 50);

  /// ラジオボタン: 枠線色
  static const Color buttonRadioBorder = Color.fromARGB(255, 40, 44, 98);

  /// 削除ボタン: 背景色
  static const Color buttonDelete = Color.fromARGB(255, 132, 51, 51);

  /// 削除ボタン: 枠線色
  static const Color buttonDeleteBorder = Color.fromARGB(255, 157, 87, 87);

  /// 期間選択ボタン: 背景色
  static const Color buttonPeriod = darkBlue;

  /// 期間選択ボタン: 背景色 アクティブ時
  static const Color buttonPeriodActive = Color.fromARGB(255, 35, 35, 106);

  /// 期間選択ボタン: 枠線色
  static const Color buttonPeriodBorder = Color.fromARGB(255, 40, 49, 145);

  /// タスク一覧ボタン: 背景色: 濃い
  static const Color buttonTaskList = Color.fromARGB(255, 26, 27, 31);

  /// タスク一覧ボタン: 背景色: 薄い
  static const Color buttonTaskListThin = Color.fromARGB(255, 43, 47, 56);

  /// タスク一覧ボタン: 枠線色
  static const Color buttonTaskListBorder = Color.fromARGB(255, 67, 69, 82);
}
