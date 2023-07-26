import 'package:flutter/material.dart' show Color;
import 'package:gamer_reflection/modules/const/color/colors.dart'
    show darkBlue, white;

class ColorTextTag {
  const ColorTextTag({
    required this.background,
    required this.redBorder,
    required this.purpleBorder,
    required this.blueBorder,
    required this.grayBorder,
    required this.redText,
    required this.purpleText,
    required this.blueText,
    required this.grayText,
    required this.grayBackGround,
  });

  final Color background;
  final Color redBorder;
  final Color purpleBorder;
  final Color blueBorder;
  final Color grayBorder;
  final Color redText;
  final Color purpleText;
  final Color blueText;
  final Color grayText;
  final Color grayBackGround;
}

ColorTextTag colorTextTag(bool isDark) {
  return ColorTextTag(
    background: isDark
        ? ConstantColorTextTagDark.background
        : ConstantColorTextTagLight.background,
    redBorder: isDark
        ? ConstantColorTextTagDark.redBorder
        : ConstantColorTextTagLight.redBorder,
    purpleBorder: isDark
        ? ConstantColorTextTagDark.purpleBorder
        : ConstantColorTextTagLight.purpleBorder,
    blueBorder: isDark
        ? ConstantColorTextTagDark.blueBorder
        : ConstantColorTextTagLight.blueBorder,
    grayBorder: isDark
        ? ConstantColorTextTagDark.grayBorder
        : ConstantColorTextTagLight.grayBorder,
    redText: isDark
        ? ConstantColorTextTagDark.redText
        : ConstantColorTextTagLight.redText,
    purpleText: isDark
        ? ConstantColorTextTagDark.purpleText
        : ConstantColorTextTagLight.purpleText,
    blueText: isDark
        ? ConstantColorTextTagDark.blueText
        : ConstantColorTextTagLight.blueText,
    grayText: isDark
        ? ConstantColorTextTagDark.grayText
        : ConstantColorTextTagLight.grayText,
    grayBackGround: isDark
        ? ConstantColorTextTagDark.grayBackGround
        : ConstantColorTextTagLight.grayBackGround,
  );
}

/// 用途ごとに色を定義する: タグの色: ダークモード
class ConstantColorTextTagDark {
  ConstantColorTextTagDark._();

  /// タグの背景色
  static const Color background = darkBlue;

  /// タグの色 枠線 red
  static const Color redBorder = Color.fromARGB(255, 201, 98, 141);

  /// タグの色 枠線 purple
  static const Color purpleBorder = Color.fromARGB(255, 152, 83, 194);

  /// タグの色 枠線 blue
  static const Color blueBorder = Color.fromARGB(255, 88, 111, 186);

  /// タグの色 枠線 gray
  static const Color grayBorder = Color.fromARGB(255, 81, 86, 98);

  /// タグの色 red
  static const Color redText = Color.fromARGB(255, 234, 151, 186);

  /// タグの色 purple
  static const Color purpleText = Color.fromARGB(255, 202, 151, 234);

  /// タグの色 blue
  static const Color blueText = Color.fromARGB(255, 151, 170, 234);

  /// タグの色 gray
  static const Color grayText = white;

  /// タグの色 背景 gray
  static const Color grayBackGround = Color.fromARGB(255, 51, 57, 67);
}

/// 用途ごとに色を定義する: タグの色: ダークモード
class ConstantColorTextTagLight {
  ConstantColorTextTagLight._();

  /// タグの背景色
  static const Color background = darkBlue;

  /// タグの色 枠線 red
  static const Color redBorder = Color.fromARGB(255, 201, 98, 141);

  /// タグの色 枠線 purple
  static const Color purpleBorder = Color.fromARGB(255, 152, 83, 194);

  /// タグの色 枠線 blue
  static const Color blueBorder = Color.fromARGB(255, 88, 111, 186);

  /// タグの色 枠線 gray
  static const Color grayBorder = Color.fromARGB(255, 81, 86, 98);

  /// タグの色 red
  static const Color redText = Color.fromARGB(255, 234, 151, 186);

  /// タグの色 purple
  static const Color purpleText = Color.fromARGB(255, 202, 151, 234);

  /// タグの色 blue
  static const Color blueText = Color.fromARGB(255, 151, 170, 234);

  /// タグの色 gray
  static const Color grayText = white;

  /// タグの色 背景 gray
  static const Color grayBackGround = Color.fromARGB(255, 51, 57, 67);
}
