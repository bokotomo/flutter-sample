import 'package:flutter/material.dart';
import 'package:gamer_reflection/components/common/atoms/text.dart'
    show BasicText;
import 'package:gamer_reflection/modules/const/color/button.dart'
    show ConstantColorButton;
import 'package:gamer_reflection/modules/const/size.dart' show ConstantSizeUI;
import 'package:gamer_reflection/components/common/atoms/spacer/width.dart'
    show SpacerWidth;

/// ボタン: ラジオ
class ButtonRadio extends StatelessWidget {
  const ButtonRadio({
    super.key,
    required this.text,
    required this.groupValue,
    required this.value,
    required this.onPressed,
  });

  /// 文字
  final String text;

  /// 選択してるグループId
  final String groupValue;

  /// グループId
  final String value;

  /// クリックした
  final void Function(String) onPressed;

  @override
  Widget build(BuildContext context) {
    /// クリックされた
    void onPressed() {
      this.onPressed(value);
    }

    final bool isActive = value == groupValue;
    final Color color = isActive
        ? const Color.fromARGB(255, 93, 168, 103)
        : const Color.fromARGB(255, 40, 40, 40);

    final style = ElevatedButton.styleFrom(
      backgroundColor: ConstantColorButton.buttonRadio,
      minimumSize: const Size.fromHeight(ConstantSizeUI.l7),
      padding: const EdgeInsets.only(left: ConstantSizeUI.l2),
      elevation: 2,
      shadowColor: isActive
          ? ConstantColorButton.buttonRadioBorderActive
          : ConstantColorButton.buttonRadioBorder,
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.all(Radius.circular(100)),
        side: BorderSide(
          width: 2.0,
          color: isActive
              ? ConstantColorButton.buttonRadioBorderActive
              : ConstantColorButton.buttonRadioBorder,
        ),
      ),
    );

    return ElevatedButton(
      onPressed: onPressed,
      style: style,
      child: Row(
        children: [
          Icon(
            Icons.adjust,
            color: color,
            size: ConstantSizeUI.l4,
          ),
          SpacerWidth.xs,
          BasicText(
            text: text,
            size: "M",
          ),
        ],
      ),
    );
  }
}
