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
      backgroundColor: isThinColor
          ? ConstantColorButton.basicThin
          : ConstantColorButton.basic,
      minimumSize: const Size.fromHeight(ConstantSizeUI.l7),
      padding: const EdgeInsets.only(
        left: ConstantSizeUI.l0,
        right: ConstantSizeUI.l0,
        top: ConstantSizeUI.l1,
        bottom: ConstantSizeUI.l1,
      ),
      elevation: 2,
      shadowColor: isThinColor
          ? ConstantColorButton.basicBorderThin
          : ConstantColorButton.basicBorder,
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.all(Radius.circular(100)),
        side: BorderSide(
          width: 2.0,
          color: isThinColor
              ? ConstantColorButton.basicBorderThin
              : ConstantColorButton.basicBorder,
        ),
      ),
    );

    return ElevatedButton(
      onPressed: onPressed,
      style: style,
      child: BasicText(
        text: text,
        size: textSize ?? "M",
        isNoSelect: true,
      ),
    );
  }
}
