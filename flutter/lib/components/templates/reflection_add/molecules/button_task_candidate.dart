import 'package:flutter/material.dart'
    show
        StatelessWidget,
        Widget,
        BuildContext,
        ElevatedButton,
        Size,
        Align,
        Alignment;
import 'package:gamer_reflection/components/common/atoms/text/basic.dart'
    show BasicText;
import 'package:gamer_reflection/modules/const/color/button.dart'
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
            ? ConstantColorButton.taskListThin
            : ConstantColorButton.taskList,
        fixedSize: const Size.fromHeight(ConstantSizeUI.l7),
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: BasicText(
          text: text,
          size: "S",
          isNoSelect: true,
        ),
      ),
    );
  }
}
