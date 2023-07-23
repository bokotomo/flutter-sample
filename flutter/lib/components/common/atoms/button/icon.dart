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
      backgroundColor: Colors.transparent,
      minimumSize: const Size.fromHeight(ConstantSizeUI.l7),
      elevation: 2,
      shadowColor: ConstantColorButton.basicBorder,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(100)),
        side: BorderSide(
          width: 2.0,
          color: ConstantColorButton.basicBorder,
        ),
      ),
    );

    return Container(
      padding: EdgeInsets.zero,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: ConstantColorButton.basic,
        ),
        borderRadius: BorderRadius.all(Radius.circular(100)),
      ),
      child: ElevatedButton.icon(
        onPressed: onPressed,
        style: style,
        icon: Icon(
          icon,
          color: ConstantColor.icon,
        ),
        label: BasicText(
          text: text,
          size: "M",
          isNoSelect: true,
        ),
      ),
    );
  }
}
