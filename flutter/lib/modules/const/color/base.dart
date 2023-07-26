import 'package:flutter/material.dart' show Color;
import 'package:gamer_reflection/modules/const/color/colors.dart'
    show darkBlue, darkBlueLittle, white, grayDark, grayLight;

class ColorBase {
  const ColorBase({
    required this.header,
    required this.footer,
    required this.content,
    required this.box,
    required this.boxBorder,
    required this.text,
    required this.textBold,
    required this.textOpacity,
    required this.taskListArrow,
    required this.icon,
    required this.iconBackGround,
    required this.iconBackGroundThin,
    required this.iconDark,
    required this.iconThin,
    required this.modalBackground,
    required this.alert,
    required this.toast,
  });

  final Color header;
  final Color footer;
  final Color content;
  final Color box;
  final Color boxBorder;
  final Color text;
  final Color textBold;
  final Color textOpacity;
  final Color taskListArrow;
  final Color icon;
  final Color iconBackGround;
  final Color iconBackGroundThin;
  final Color iconDark;
  final Color iconThin;
  final Color modalBackground;
  final Color alert;
  final Color toast;
}

ColorBase colorBase(bool isDark) {
  /// ヘッダーの背景色
  header() {
    if (isDark) return ConstantColorDark.header;
    return ConstantColorLight.header;
  }

  /// フッターの背景色
  footer() {
    if (isDark) return ConstantColorDark.footer;
    return ConstantColorLight.footer;
  }

  /// コンテンツの背景色
  content() {
    if (isDark) return ConstantColorDark.content;
    return ConstantColorLight.content;
  }

  /// ボックスの背景色
  box() {
    if (isDark) return ConstantColorDark.box;
    return ConstantColorLight.box;
  }

  /// ボックスの枠線色
  boxBorder() {
    if (isDark) return ConstantColorDark.boxBorder;
    return ConstantColorLight.boxBorder;
  }

  /// 基本的な文字色
  text() {
    if (isDark) return ConstantColorDark.text;
    return ConstantColorLight.text;
  }

  /// 基本的な文字色: 太字
  textBold() {
    if (isDark) return ConstantColorDark.textBold;
    return ConstantColorLight.textBold;
  }

  /// 薄い文字
  textOpacity() {
    if (isDark) return ConstantColorDark.textOpacity;
    return ConstantColorLight.textOpacity;
  }

  /// タスクリストの矢印の色
  taskListArrow() {
    if (isDark) return ConstantColorDark.taskListArrow;
    return ConstantColorLight.taskListArrow;
  }

  /// アイコンの色
  icon() {
    if (isDark) return ConstantColorDark.icon;
    return ConstantColorLight.icon;
  }

  /// アイコンの背景の円の色
  iconBackGround() {
    if (isDark) return ConstantColorDark.iconBackGround;
    return ConstantColorLight.iconBackGround;
  }

  /// アイコンの背景の円の色 薄い
  iconBackGroundThin() {
    if (isDark) return ConstantColorDark.iconBackGroundThin;
    return ConstantColorLight.iconBackGroundThin;
  }

  /// アイコンの色
  iconDark() {
    if (isDark) return ConstantColorDark.iconDark;
    return ConstantColorLight.iconDark;
  }

  /// 薄いアイコンの色
  iconThin() {
    if (isDark) return ConstantColorDark.iconThin;
    return ConstantColorLight.iconThin;
  }

  /// モーダルのコンテンツ後ろの背景
  modalBackground() {
    if (isDark) return ConstantColorDark.modalBackground;
    return ConstantColorLight.modalBackground;
  }

  /// アラートの背景色
  alert() {
    if (isDark) return ConstantColorDark.alert;
    return ConstantColorLight.alert;
  }

  /// トースト（ポップアップ）の背景色
  toast() {
    if (isDark) return ConstantColorDark.toast;
    return ConstantColorLight.toast;
  }

  return ColorBase(
    header: header(),
    footer: footer(),
    content: content(),
    box: box(),
    boxBorder: boxBorder(),
    text: text(),
    textBold: textBold(),
    textOpacity: textOpacity(),
    taskListArrow: taskListArrow(),
    icon: icon(),
    iconBackGround: iconBackGround(),
    iconBackGroundThin: iconBackGroundThin(),
    iconDark: iconDark(),
    iconThin: iconThin(),
    modalBackground: modalBackground(),
    alert: alert(),
    toast: toast(),
  );
}

/// 基本的な色: ダークモード
class ConstantColorDark {
  ConstantColorDark._();

  /// ヘッダーの背景色
  static const Color header = darkBlueLittle;

  /// フッターの背景色
  static const Color footer = darkBlueLittle;

  /// コンテンツの背景色
  static const Color content = darkBlue;

  /// 基本的な文字色
  static const Color text = white;

  /// 基本的な文字色: 太字
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
  static const Color text = Color.fromARGB(255, 16, 18, 46);

  /// 基本的な文字色
  static const Color textBold = Color.fromARGB(180, 255, 255, 255);

  /// 薄い文字
  static const Color textOpacity = Color.fromARGB(120, 255, 255, 255);

  /// ボックスの背景色
  static const Color box = Color.fromARGB(255, 239, 239, 239);

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
