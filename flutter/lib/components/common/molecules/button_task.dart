import 'package:flutter/material.dart';
import 'package:gamer_reflection/components/common/atoms/text.dart'
    show BasicText;
import 'package:gamer_reflection/modules/const/color.dart' show ConstantColor;
import 'package:gamer_reflection/modules/const/size.dart' show ConstantSizeUI;

/// ボタン: タスク一覧ページ
class ButtonTask extends StatelessWidget {
  const ButtonTask({
    super.key,
    required this.text,
    required this.isThin,
    this.onPressed,
  });

  /// 文字
  final String text;

  /// 薄いか
  final bool isThin;

  /// クリックした
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    void onPressed() {
      if (this.onPressed == null) return;
      this.onPressed!();
    }

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: isThin
            ? ConstantColor.buttonTaskListThin
            : ConstantColor.buttonTaskList,
        minimumSize: const Size.fromHeight(ConstantSizeUI.l10),
      ),
      child: BasicText(
        text: text,
        size: "M",
      ),
    );
  }
}

//ConstantColor.buttonTaskListBorder,