import 'package:flutter/material.dart';
import 'package:gamer_reflection/modules/const/color.dart' show ConstantColor;

/// ボタン: 丸
class ButtonCircle extends StatelessWidget {
  const ButtonCircle({
    super.key,
    required this.onPressed,
  });
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    void onPressed() {
      if (this.onPressed == null) return;
      this.onPressed!();
    }

    return FloatingActionButton(
      backgroundColor: ConstantColor.button,
      onPressed: onPressed,
      child: const Icon(Icons.add),
    );
  }
}
