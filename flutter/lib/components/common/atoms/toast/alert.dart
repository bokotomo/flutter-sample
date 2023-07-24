import 'package:flutter/material.dart'
    show
        StatelessWidget,
        Widget,
        BuildContext,
        Container,
        EdgeInsets,
        BoxDecoration,
        BorderRadius;
import 'package:gamer_reflection/components/common/atoms/text/basic.dart'
    show BasicText;
import 'package:gamer_reflection/modules/const/size.dart' show ConstantSizeUI;
import 'package:gamer_reflection/modules/const/color/base.dart'
    show ConstantColor;

/// トースト: 注意
class ToastAlert extends StatelessWidget {
  const ToastAlert({
    super.key,
    required this.text,
  });

  /// 文字
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: ConstantSizeUI.l3,
        vertical: 12,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(ConstantSizeUI.l3),
        color: ConstantColor.alert,
      ),
      child: BasicText(
        text: text,
        size: "M",
      ),
    );
  }
}
