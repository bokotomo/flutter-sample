import 'package:flutter/material.dart';
import 'package:gamer_reflection/modules/const/color.dart' show ConstantColor;
import 'package:gamer_reflection/modules/const/size.dart' show ConstantSizeUI;

/// ボタン: 基本
class ButtonBasic extends StatelessWidget {
  const ButtonBasic({
    super.key,
    required this.text,
    required this.icon,
    this.onPressed,
  });
  // 文字
  final String text;
  // 文字
  final IconData icon;
  // クリックした
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    void onPressed() {
      if (this.onPressed == null) {
        return;
      }
      this.onPressed!();
    }

    return ElevatedButton.icon(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: ConstantColor.button,
        minimumSize: const Size.fromHeight(ConstantSizeUI.l7),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(100)),
          side: BorderSide(width: 2.0, color: ConstantColor.buttoBorder),
        ),
      ),
      icon: Icon(icon),
      label: Text(text),
    );
  }
}
