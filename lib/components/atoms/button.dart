import 'package:flutter/material.dart';
import 'package:gamer_reflection/modules/const/color.dart' as color;

/// ボタン: 丸
class ButtonCircle extends StatelessWidget {
  const ButtonCircle({
    super.key,
    required this.onPressed,
  });
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    void onPressed() {
      this.onPressed();
    }

    return FloatingActionButton(
      backgroundColor: color.buttonColor,
      onPressed: onPressed,
      child: const Icon(Icons.add),
    );
  }
}
