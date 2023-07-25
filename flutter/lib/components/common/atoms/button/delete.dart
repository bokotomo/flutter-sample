import 'package:flutter/material.dart'
    show
        StatelessWidget,
        Icons,
        Icon,
        Widget,
        BuildContext,
        ElevatedButton,
        Size,
        EdgeInsets,
        RoundedRectangleBorder,
        BorderRadius,
        Radius,
        BorderSide;
import 'package:gamer_reflection/components/common/atoms/text/basic.dart'
    show BasicText;
import 'package:gamer_reflection/modules/const/color/button.dart'
    show ConstantColorButton;
import 'package:gamer_reflection/modules/const/color/base.dart'
    show ConstantColor;
import 'package:gamer_reflection/modules/const/size.dart' show ConstantSizeUI;

/// ボタン: 削除
class ButtonDelete extends StatelessWidget {
  const ButtonDelete({
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
    /// クリックされた
    void onPressed() {
      this.onPressed();
    }

    final style = ElevatedButton.styleFrom(
      padding: EdgeInsets.zero,
      backgroundColor: ConstantColorButton.delete,
      minimumSize: const Size.fromHeight(ConstantSizeUI.l7),
      elevation: 2,
      shadowColor: ConstantColorButton.deleteBorder,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(100)),
        side: BorderSide(
          width: 2.0,
          color: ConstantColorButton.deleteBorder,
        ),
      ),
    );

    return ElevatedButton.icon(
      onPressed: onPressed,
      style: style,
      icon: const Icon(
        Icons.delete,
        color: ConstantColor.icon,
      ),
      label: BasicText(
        text: text,
        size: "M",
        isNoSelect: true,
      ),
    );
  }
}
