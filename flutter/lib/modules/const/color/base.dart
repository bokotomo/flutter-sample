import 'package:flutter/material.dart' show Color;
import 'package:gamer_reflection/modules/const/color/colors.dart'
    show darkBlue, darkBlueLittle, white, grayDark, grayLight;

/// 基本的な色: ダークモード
class ConstantColor {
  ConstantColor._();

  /// ヘッダーの背景色
  static const Color header = darkBlueLittle;

  /// フッターの背景色
  static const Color footer = darkBlueLittle;

  /// コンテンツの背景色
  static const Color content = darkBlue;

  /// 基本的な文字色
  static const Color text = white;

  /// 基本的な文字色
  static const Color textBold = Color.fromARGB(180, 255, 255, 255);

  /// 薄い文字
  static const Color textOpacity = Color.fromARGB(120, 255, 255, 255);

  /// ボックスの背景色
  static const Color box = grayDark;

  /// ボックスの枠線色
  static const Color boxBorder = grayLight;

  /// タスクリストの矢印の色
  static const Color taskListArrow = Color.fromARGB(55, 255, 255, 255);

  /// アイコンの色
  static const Color icon = Color.fromARGB(200, 255, 255, 255);

  /// アイコンの背景の円の色
  static const Color iconBackGround = Color.fromARGB(110, 255, 255, 255);

  /// アイコンの背景の円の色 薄い
  static const Color iconBackGroundThin = Color.fromARGB(55, 255, 255, 255);

  /// アイコンの色
  static const Color iconDark = Color.fromARGB(199, 26, 26, 55);

  /// 薄いアイコンの色
  static const Color iconThin = Color.fromARGB(160, 255, 255, 255);

  /// モーダルのコンテンツ後ろの背景
  static const Color modalBackground = Color.fromARGB(180, 0, 0, 0);

  /// アラートの背景色
  static const Color alert = Color.fromARGB(230, 200, 80, 135);

  /// トースト（ポップアップ）の背景色
  static const Color toast = Color.fromARGB(230, 76, 76, 130);
}

/// 基本的な色: ライトモード
class ConstantColorLight {
  ConstantColorLight._();

  /// ヘッダーの背景色
  static const Color header = Color.fromARGB(180, 255, 255, 255);

  /// フッターの背景色
  static const Color footer = Color.fromARGB(180, 255, 255, 255);

  /// コンテンツの背景色
  static const Color content = Color.fromARGB(180, 242, 242, 245);

  /// 基本的な文字色
  static const Color text = white;

  /// 基本的な文字色
  static const Color textBold = Color.fromARGB(180, 255, 255, 255);

  /// 薄い文字
  static const Color textOpacity = Color.fromARGB(120, 255, 255, 255);

  /// ボックスの背景色
  static const Color box = grayDark;

  /// ボックスの枠線色
  static const Color boxBorder = grayLight;

  /// タスクリストの矢印の色
  static const Color taskListArrow = Color.fromARGB(55, 255, 255, 255);

  /// アイコンの色
  static const Color icon = Color.fromARGB(200, 255, 255, 255);

  /// アイコンの背景の円の色
  static const Color iconBackGround = Color.fromARGB(110, 255, 255, 255);

  /// アイコンの背景の円の色 薄い
  static const Color iconBackGroundThin = Color.fromARGB(55, 255, 255, 255);

  /// アイコンの色
  static const Color iconDark = Color.fromARGB(199, 26, 26, 55);

  /// 薄いアイコンの色
  static const Color iconThin = Color.fromARGB(160, 255, 255, 255);

  /// モーダルのコンテンツ後ろの背景
  static const Color modalBackground = Color.fromARGB(180, 0, 0, 0);

  /// アラートの背景色
  static const Color alert = Color.fromARGB(230, 200, 80, 135);

  /// トースト（ポップアップ）の背景色
  static const Color toast = Color.fromARGB(230, 76, 76, 130);
}
