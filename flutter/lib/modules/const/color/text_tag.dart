import 'package:flutter/material.dart' show Color;
import 'package:gamer_reflection/modules/const/color/colors.dart'
    show darkBlue, white;

/// 用途ごとに色を定義する: タグの色
class ConstantColorTextTag {
  ConstantColorTextTag._();

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
