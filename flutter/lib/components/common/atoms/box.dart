// import 'package:flutter/material.dart';
// import 'package:gamer_reflection/modules/const/size.dart' as constSize;
// import 'package:gamer_reflection/modules/const/color.dart' show ConstantColor;

// /// 基本的なテキスト
// class Box extends StatelessWidget {
//   const Box({
//     super.key,
//     required this.text,
//     required this.size,
//   });
//   // 文字
//   final String text;
//   // サイズ
//   final String size;

//   /// 文字サイズを返す
//   double getFontSize() {
//     if (size == "L") {
//       return constSize.fontL;
//     } else if (size == "M") {
//       return constSize.fontM;
//     }
//     return constSize.fontS;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       text,
//       style: TextStyle(
//         fontSize: getFontSize(),
//         color: color.textColor,
//       ),
//     );
//   }
// }
