import 'package:flutter/material.dart';
import 'package:gamer_reflection/modules/const/color.dart'
    show ConstantColorButton;

/// ボタン: 丸
class ButtonCircle extends StatelessWidget {
  const ButtonCircle({
    super.key,
    required this.onPressed,
  });

  /// クリックした
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    /// クリックされた
    void onPressed() {
      if (this.onPressed == null) return;
      this.onPressed!();
    }

    return FloatingActionButton(
      backgroundColor: ConstantColorButton.button,
      onPressed: onPressed,
      child: const Icon(Icons.add),
    );
  }
}
