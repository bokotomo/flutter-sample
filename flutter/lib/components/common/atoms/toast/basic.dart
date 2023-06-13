import 'package:flutter/material.dart'
    show
        StatelessWidget,
        Color,
        Widget,
        BuildContext,
        Container,
        EdgeInsets,
        BoxDecoration,
        BorderRadius;
import 'package:gamer_reflection/components/common/atoms/text/basic.dart'
    show BasicText;
import 'package:gamer_reflection/modules/const/size.dart' show ConstantSizeUI;

/// トースト
class ToastBasic extends StatelessWidget {
  const ToastBasic({
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
        borderRadius: BorderRadius.circular(100),
        color: const Color.fromARGB(230, 90, 90, 130),
      ),
      child: BasicText(
        text: text,
        size: "M",
      ),
    );
  }
}
