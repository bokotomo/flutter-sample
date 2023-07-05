import 'package:flutter/material.dart';
import 'package:gamer_reflection/components/common/atoms/text/basic.dart'
    show BasicText;
import 'package:gamer_reflection/modules/const/color/button.dart'
    show ConstantColorButton;
import 'package:gamer_reflection/modules/const/size.dart' show ConstantSizeUI;

/// 期間を選択するボタン
class ButtonPeriod extends StatelessWidget {
  const ButtonPeriod({
    super.key,
    required this.text,
    required this.isActive,
    this.onPressed,
  });

  /// 文字
  final String text;

  /// アクティブかどうか
  final bool isActive;

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
      backgroundColor: isActive
          ? ConstantColorButton.periodActive
          : ConstantColorButton.period,
      elevation: 4,
      padding: const EdgeInsets.only(
        left: ConstantSizeUI.l4,
        right: ConstantSizeUI.l4,
        top: ConstantSizeUI.l1,
        bottom: ConstantSizeUI.l1,
      ),
      shadowColor: ConstantColorButton.periodBorder,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(100)),
        side: BorderSide(
          width: 2.0,
          color: ConstantColorButton.periodBorder,
        ),
      ),
    );

    return ElevatedButton(
      onPressed: onPressed,
      style: style,
      child: BasicText(
        text: text,
        size: "M",
        isNoSelect: true,
      ),
    );
  }
}
