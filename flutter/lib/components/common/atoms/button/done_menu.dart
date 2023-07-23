import 'package:flutter/material.dart';
import 'package:gamer_reflection/components/common/atoms/text/basic.dart'
    show BasicText;
import 'package:gamer_reflection/modules/const/color/button.dart'
    show ConstantColorButton;
import 'package:gamer_reflection/modules/const/size.dart' show ConstantSizeUI;

/// ボタン
class ButtonDoneMenu extends StatelessWidget {
  const ButtonDoneMenu({
    super.key,
    required this.text,
    required this.onPressed,
  });

  /// 文字
  final String text;

  /// クリックした
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final style = ElevatedButton.styleFrom(
      backgroundColor: Colors.transparent,
      minimumSize: const Size.fromHeight(ConstantSizeUI.l4),
      padding: EdgeInsets.zero,
      elevation: 0,
      fixedSize: const Size.fromHeight(ConstantSizeUI.l4),
      shadowColor: ConstantColorButton.doneBorder,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(100)),
      ),
    );

    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: ConstantColorButton.done,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(100)),
        border: Border.all(
          color: ConstantColorButton.doneBorder,
        ),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: style,
        child: BasicText(
          text: text,
          size: "M",
          isNoSelect: true,
        ),
      ),
    );
  }
}
