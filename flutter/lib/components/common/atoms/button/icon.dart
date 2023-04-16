import 'package:flutter/material.dart';
import 'package:gamer_reflection/components/common/atoms/text/basic.dart'
    show BasicText;
import 'package:gamer_reflection/modules/const/color/button.dart'
    show ConstantColorButton;
import 'package:gamer_reflection/modules/const/color/base.dart'
    show ConstantColor;
import 'package:gamer_reflection/modules/const/size.dart' show ConstantSizeUI;

/// ボタン: アイコン付き
class ButtonIcon extends StatelessWidget {
  const ButtonIcon({
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
    /// クリックされた
    void onPressed() {
      if (this.onPressed == null) return;
      this.onPressed!();
    }

    final style = ElevatedButton.styleFrom(
      backgroundColor: ConstantColorButton.button,
      minimumSize: const Size.fromHeight(ConstantSizeUI.l7),
      elevation: 2,
      shadowColor: ConstantColorButton.buttonBorder,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(100)),
        side: BorderSide(
          width: 2.0,
          color: ConstantColorButton.buttonBorder,
        ),
      ),
    );

    return ElevatedButton.icon(
      onPressed: onPressed,
      style: style,
      icon: Icon(
        icon,
        color: ConstantColor.icon,
      ),
      label: BasicText(
        text: text,
        size: "M",
      ),
    );
  }
}
