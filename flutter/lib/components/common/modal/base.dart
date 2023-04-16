import 'package:flutter/material.dart'
    show
        StatelessWidget,
        Widget,
        BuildContext,
        SimpleDialog,
        EdgeInsets,
        Center;
import 'package:gamer_reflection/components/common/atoms/text/basic.dart'
    show BasicText;
import 'package:gamer_reflection/modules/const/color/base.dart'
    show ConstantColor;
import 'package:gamer_reflection/modules/const/size.dart' show ConstantSizeUI;

/// 基本的なモーダル
class ModalBase extends StatelessWidget {
  const ModalBase({
    super.key,
    required this.title,
    required this.children,
  });

  /// タイトル
  final String title;

  /// コンテンツ
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      backgroundColor: ConstantColor.box,
      title: Center(
        child: BasicText(
          text: title,
          size: "M",
        ),
      ),
      insetPadding: const EdgeInsets.all(ConstantSizeUI.l4),
      titlePadding: const EdgeInsets.all(ConstantSizeUI.l3),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: ConstantSizeUI.l3,
      ),
      children: children,
    );
  }
}
