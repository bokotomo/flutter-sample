import 'package:flutter/material.dart';
import 'package:gamer_reflection/components/common/atoms/text.dart'
    show BasicText;
import 'package:gamer_reflection/modules/const/color.dart'
    show ConstantColorButton;
import 'package:gamer_reflection/modules/const/size.dart' show ConstantSizeUI;

/// ボタン: 完了
class ButtonDone extends StatelessWidget {
  const ButtonDone({
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
    /// クリックされた
    void onPressed() {
      if (this.onPressed == null) return;
      this.onPressed!();
    }

    final style = ElevatedButton.styleFrom(
      backgroundColor: ConstantColorButton.buttonDone,
      minimumSize: const Size.fromHeight(ConstantSizeUI.l7),
      elevation: 2,
      shadowColor: ConstantColorButton.buttonDoneBorder,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(100)),
        side: BorderSide(
          width: 2.0,
          color: ConstantColorButton.buttonDoneBorder,
        ),
      ),
    );

    return ElevatedButton.icon(
      onPressed: onPressed,
      style: style,
      icon: const Icon(Icons.check_circle),
      label: BasicText(text: text, size: "M"),
    );
  }
}
