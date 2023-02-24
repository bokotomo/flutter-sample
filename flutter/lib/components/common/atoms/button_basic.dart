import 'package:flutter/material.dart';
import 'package:gamer_reflection/components/common/atoms/text.dart'
    show BasicText;
import 'package:gamer_reflection/modules/const/color.dart'
    show ConstantColorButton;
import 'package:gamer_reflection/modules/const/size.dart' show ConstantSizeUI;

/// ボタン: 基本
class ButtonBasic extends StatelessWidget {
  const ButtonBasic({
    super.key,
    required this.text,
    required this.icon,
    this.onPressed,
  });

  /// 文字
  final String text;

  /// アイコン
  final IconData icon;

  /// クリックした
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
        backgroundColor: ConstantColorButton.button,
        minimumSize: const Size.fromHeight(ConstantSizeUI.l7),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(100)),
          side: BorderSide(
            width: 2.0,
            color: ConstantColorButton.buttonBorder,
          ),
        ),
      ),
      icon: Icon(icon),
      label: BasicText(
        text: text,
        size: "M",
      ),
    );
  }
}
