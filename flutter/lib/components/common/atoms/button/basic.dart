import 'package:flutter/material.dart';
import 'package:gamer_reflection/components/common/atoms/text/basic.dart'
    show BasicText;
import 'package:gamer_reflection/modules/const/color/button.dart'
    show ConstantColorButton;
import 'package:gamer_reflection/modules/const/size.dart' show ConstantSizeUI;

/// ボタン
class ButtonBasic extends StatelessWidget {
  const ButtonBasic({
    super.key,
    required this.text,
    this.onPressed,
    this.textSize,
    this.isThin,
  });

  /// 文字
  final String text;

  /// 薄いか
  final bool? isThin;

  /// 文字サイズ
  final String? textSize;

  /// クリックした
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final isThinColor = isThin ?? false;

    /// クリックされた
    void onPressed() {
      if (this.onPressed == null) return;
      this.onPressed!();
    }

    final style = ElevatedButton.styleFrom(
      backgroundColor: Colors.transparent,
      minimumSize: const Size.fromHeight(ConstantSizeUI.l7),
      shadowColor: isThinColor
          ? ConstantColorButton.basicBorderThin
          : ConstantColorButton.basicBorder,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(100)),
      ),
      elevation: 0,
    );

    return Container(
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: isThinColor
              ? ConstantColorButton.basicThin
              : ConstantColorButton.basic,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(100)),
        border: Border.all(
          color: isThinColor
              ? ConstantColorButton.basicBorderThin
              : ConstantColorButton.basicBorder,
        ),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: style,
        child: BasicText(
          text: text,
          size: textSize ?? "M",
          isNoSelect: true,
        ),
      ),
    );
  }
}
