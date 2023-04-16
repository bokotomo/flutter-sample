import 'package:flutter/material.dart';
import 'package:gamer_reflection/components/common/atoms/text/basic.dart'
    show BasicText;
import 'package:gamer_reflection/modules/const/color/button.dart'
    show ConstantColorButton;
import 'package:gamer_reflection/modules/const/size.dart' show ConstantSizeUI;

/// 薄いボタン
class ButtonThin extends StatelessWidget {
  const ButtonThin({
    super.key,
    required this.text,
    required this.isActive,
    required this.onPressed,
  });

  /// 文字
  final String text;

  /// クリックした
  final void Function() onPressed;

  /// アクティブか
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    /// クリックされた
    void onPressed() {
      this.onPressed();
    }

    final style = ElevatedButton.styleFrom(
      backgroundColor:
          isActive ? ConstantColorButton.thinActive : ConstantColorButton.thin,
      minimumSize: const Size.fromHeight(ConstantSizeUI.l7),
      elevation: 2,
      shadowColor: isActive
          ? ConstantColorButton.thinActiveBorder
          : ConstantColorButton.thinBorder,
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.all(Radius.circular(100)),
        side: BorderSide(
          width: 2.0,
          color: isActive
              ? ConstantColorButton.thinActiveBorder
              : ConstantColorButton.thinBorder,
        ),
      ),
    );

    return ElevatedButton(
      onPressed: onPressed,
      style: style,
      child: BasicText(
        text: text,
        size: "M",
      ),
    );
  }
}
