import 'package:flutter/material.dart';
import 'package:gamer_reflection/components/common/atoms/text.dart'
    show BasicText;
import 'package:gamer_reflection/modules/const/color.dart'
    show ConstantColorButton;
import 'package:gamer_reflection/modules/const/size.dart' show ConstantSizeUI;

/// ボタン: タスク候補一覧
class ButtonTaskCandidate extends StatelessWidget {
  const ButtonTaskCandidate({
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
    /// クリックされた
    void onPressed() {
      if (this.onPressed == null) return;
      this.onPressed!();
    }

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: isThin
            ? ConstantColorButton.buttonTaskListThin
            : ConstantColorButton.buttonTaskList,
        minimumSize: const Size.fromHeight(ConstantSizeUI.l8),
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: BasicText(
          text: text,
          size: "S",
        ),
      ),
    );
  }
}
