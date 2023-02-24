import 'package:flutter/material.dart';
import 'package:gamer_reflection/components/common/atoms/text.dart'
    show BasicText;
import 'package:gamer_reflection/modules/const/color.dart'
    show ConstantColorButton;
import 'package:gamer_reflection/modules/const/size.dart' show ConstantSizeUI;

/// ボタン: 候補
class ButtonCandidate extends StatelessWidget {
  const ButtonCandidate({
    super.key,
    required this.text,
    this.onPressed,
  });

  /// 文字
  final String text;

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

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: ConstantColorButton.button,
        minimumSize: const Size.fromHeight(ConstantSizeUI.l5),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(100)),
          side: BorderSide(
            width: 2.0,
            color: ConstantColorButton.buttonBorder,
          ),
        ),
      ),
      child: BasicText(
        text: text,
        size: "S",
      ),
    );
  }
}
