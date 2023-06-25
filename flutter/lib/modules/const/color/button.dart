import 'package:flutter/material.dart' show Color;
import 'package:gamer_reflection/modules/const/color/colors.dart'
    show darkBlue, blue;

/// 用途ごとに色を定義する: ボタンの色
class ConstantColorButton {
  ConstantColorButton._();

  /// ボタン: 背景色
  static const Color basic = Color.fromARGB(255, 37, 39, 93);

  /// ボタン: 枠線色
  static const Color basicBorder = blue;

  /// 薄いボタン: 背景色
  static const Color thin = Color.fromARGB(255, 8, 8, 13);

  /// 薄いボタン: 枠線色
  static const Color thinBorder = Color.fromARGB(255, 35, 39, 77);

  /// 薄いボタン: アクティブ状態の背景色
  static const Color thinActive = Color.fromARGB(255, 43, 47, 56);

  /// 薄いボタン: アクティブ状態の枠線色
  static const Color thinActiveBorder = Color.fromARGB(255, 68, 79, 118);

  /// 完了ボタン: 背景色
  static const Color done = Color.fromARGB(255, 85, 129, 91);

  /// 完了ボタン: 背景色 非選択状態
  static const Color doneDisable = Color.fromARGB(255, 98, 123, 100);

  /// 完了ボタン: 枠線色
  static const Color doneBorder = Color.fromARGB(255, 92, 159, 105);

  /// 完了ボタン: 枠線色 非選択状態
  static const Color doneBorderDisable = Color.fromARGB(255, 61, 109, 70);

  /// キャンセルボタン: 背景色
  static const Color cancel = Color.fromARGB(255, 94, 94, 103);

  /// キャンセルボタン: 枠線色
  static const Color cancelBorder = Color.fromARGB(255, 122, 122, 131);

  /// ラジオボタン: 背景色
  static const Color radio = Color.fromARGB(255, 29, 33, 50);

  /// ラジオボタン: 枠線色
  static const Color radioBorder = Color.fromARGB(255, 40, 44, 98);

  /// ラジオボタン: 枠線色アクティブ
  static const Color radioBorderActive = blue;

  /// 削除ボタン: 背景色
  static const Color delete = Color.fromARGB(255, 132, 51, 51);

  /// 削除ボタン: 枠線色
  static const Color deleteBorder = Color.fromARGB(255, 157, 87, 87);

  /// 期間選択ボタン: 背景色
  static const Color period = darkBlue;

  /// 期間選択ボタン: 背景色 アクティブ時
  static const Color periodActive = Color.fromARGB(255, 35, 35, 106);

  /// 期間選択ボタン: 枠線色
  static const Color periodBorder = blue;

  /// タスク一覧ボタン: 背景色: 濃い
  static const Color taskList = Color.fromARGB(255, 26, 27, 31);

  /// タスク一覧ボタン: 背景色: 薄い
  static const Color taskListThin = Color.fromARGB(255, 43, 47, 56);

  /// タスク一覧ボタン: 枠線色
  static const Color taskListBorder = Color.fromARGB(255, 67, 69, 82);
}
