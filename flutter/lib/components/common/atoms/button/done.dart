import 'package:flutter/material.dart';
import 'package:gamer_reflection/components/common/atoms/text/basic.dart'
    show BasicText;
import 'package:gamer_reflection/modules/const/color/button.dart'
    show ConstantColorButton;
import 'package:gamer_reflection/modules/const/color/base.dart'
    show ConstantColor;
import 'package:gamer_reflection/modules/const/size.dart' show ConstantSizeUI;

/// ボタン: 完了
class ButtonDone extends StatelessWidget {
  const ButtonDone({
    super.key,
    required this.text,
    this.isActive,
    this.onPressed,
  });

  /// 文字
  final String text;

  /// アクティブかどうか
  final bool? isActive;

  /// クリックした
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    /// アクティブ状態か
    bool isActiveMode() {
      if (isActive == null) return true;
      return isActive!;
    }

    /// クリックされた
    void onPressed() {
      if (this.onPressed == null) return;
      this.onPressed!();
    }

    final style = ElevatedButton.styleFrom(
      backgroundColor: ConstantColorButton.done,
      disabledBackgroundColor: ConstantColorButton.doneDisable,
      minimumSize: const Size.fromHeight(ConstantSizeUI.l7),
      elevation: 2,
      shadowColor: isActiveMode()
          ? ConstantColorButton.doneBorder
          : ConstantColorButton.doneBorderDisable,
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.all(Radius.circular(100)),
        side: BorderSide(
          width: 2.0,
          color: isActiveMode()
              ? ConstantColorButton.doneBorder
              : ConstantColorButton.doneBorderDisable,
        ),
      ),
    );

    return ElevatedButton.icon(
      onPressed: isActiveMode() ? onPressed : null,
      style: style,
      icon: const Icon(
        Icons.check_circle,
        color: ConstantColor.icon,
      ),
      label: BasicText(
        text: text,
        size: "M",
      ),
    );
  }
}
