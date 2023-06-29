import 'package:flutter/material.dart';
import 'package:gamer_reflection/components/common/atoms/text/basic.dart'
    show BasicText;
import 'package:gamer_reflection/modules/const/color/base.dart'
    show ConstantColor;
import 'package:gamer_reflection/components/common/atoms/spacer/width.dart'
    show SpacerWidth;
import 'package:gamer_reflection/modules/const/size.dart' show ConstantSizeUI;

/// ボタン: リンク
class ButtonLinks extends StatelessWidget {
  const ButtonLinks({
    super.key,
    required this.text,
    required this.onPressed,
  });

  /// 文字
  final String text;

  /// クリックした
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: ConstantColor.box,
        minimumSize: const Size.fromHeight(ConstantSizeUI.l10),
        padding: const EdgeInsets.only(
          left: ConstantSizeUI.l3,
          right: 0,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: BasicText(
              text: text,
              size: "M",
            ),
          ),
          SpacerWidth.s,
          const Icon(
            Icons.arrow_right,
            color: ConstantColor.taskListArrow,
            size: 40.0,
          ),
        ],
      ),
    );
  }
}
