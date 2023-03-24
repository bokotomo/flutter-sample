import 'package:flutter/material.dart' show Color;
import 'package:gamer_reflection/modules/const/color/colors.dart'
    show darkBlue, white;

/// 用途ごとに色を定義する: タグの色
class ConstantColorTextTag {
  ConstantColorTextTag._();

  /// タグの背景色
  static const Color textTagBackground = darkBlue;

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
  static const Color textTagGrayText = white;

  /// タグの色 背景 gray
  static const Color textTagGrayBackGround = Color.fromARGB(255, 51, 57, 67);
}
