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
      backgroundColor: ConstantColorButton.done,
      minimumSize: const Size.fromHeight(ConstantSizeUI.l4),
      padding: EdgeInsets.zero,
      elevation: 2,
      fixedSize: const Size.fromHeight(ConstantSizeUI.l4),
      shadowColor: ConstantColorButton.doneBorder,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(100)),
        side: BorderSide(
          width: 2.0,
          color: ConstantColorButton.doneBorder,
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
