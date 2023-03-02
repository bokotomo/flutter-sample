import 'package:flutter/material.dart';
import 'package:gamer_reflection/components/common/atoms/text.dart'
    show BasicText;
import 'package:gamer_reflection/modules/const/color.dart'
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

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: isActive
            ? ConstantColorButton.buttonPeriodActive
            : ConstantColorButton.buttonPeriod,
        // minimumSize: const Size.fromHeight(ConstantSizeUI.l7),
        elevation: 4,
        shadowColor: ConstantColorButton.buttonPeriodBorder,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(100)),
          side: BorderSide(
            width: 2.0,
            color: ConstantColorButton.buttonPeriodBorder,
          ),
        ),
      ),
      child: BasicText(
        text: text,
        size: "M",
      ),
    );
  }
}
