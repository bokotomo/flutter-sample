import 'package:flutter/material.dart'
    show
        StatelessWidget,
        Widget,
        BuildContext,
        ElevatedButton,
        Size,
        RoundedRectangleBorder,
        BorderRadius,
        EdgeInsets,
        Radius,
        BorderSide;
import 'package:gamer_reflection/components/common/atoms/text/basic.dart'
    show BasicText;
import 'package:gamer_reflection/modules/const/color/button.dart'
    show ConstantColorButton;
import 'package:gamer_reflection/modules/const/size.dart' show ConstantSizeUI;

/// ボタン: キャンセル
class ButtonCancel extends StatelessWidget {
  const ButtonCancel({
    super.key,
    required this.text,
    this.onPressed,
  });

  /// 文字
  final String text;

  /// クリックした
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    /// クリックされた
    void onPressed() {
      if (this.onPressed == null) return;
      this.onPressed!();
    }

    final style = ElevatedButton.styleFrom(
      padding: EdgeInsets.zero,
      backgroundColor: ConstantColorButton.cancel,
      minimumSize: const Size.fromHeight(ConstantSizeUI.l7),
      elevation: 4,
      shadowColor: ConstantColorButton.cancelBorder,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(100)),
        side: BorderSide(
          width: 2.0,
          color: ConstantColorButton.cancelBorder,
        ),
      ),
    );

    return ElevatedButton(
      onPressed: onPressed,
      style: style,
      child: BasicText(
        text: text,
        size: "M",
        isNoSelect: true,
      ),
    );
  }
}
