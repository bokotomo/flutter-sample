import 'package:flutter/material.dart'
    show
        StatelessWidget,
        Widget,
        BuildContext,
        BoxDecoration,
        Border,
        Container,
        BorderRadius,
        EdgeInsets,
        Alignment,
        Stack,
        CircleAvatar,
        IconButton,
        Icon,
        Icons,
        Positioned;
import 'package:gamer_reflection/modules/const/color/base.dart'
    show ConstantColor;
import 'package:gamer_reflection/modules/const/size.dart' show ConstantSizeUI;

/// 削除ボタン付きコンテンツ
class Card extends StatelessWidget {
  const Card({
    super.key,
    required this.child,
    required this.onClickRemove,
  });

  /// 文字
  final Widget child;
  final Function() onClickRemove;

  @override
  Widget build(BuildContext context) {
    final decoration = BoxDecoration(
      color: ConstantColor.box,
      border: Border.all(color: ConstantColor.boxBorder),
      borderRadius: BorderRadius.circular(ConstantSizeUI.l1),
    );

    return Stack(
      alignment: Alignment.topRight,
      children: [
        Container(
          padding: const EdgeInsets.only(
            top: ConstantSizeUI.l3,
            left: ConstantSizeUI.l3,
            bottom: ConstantSizeUI.l3,
            right: ConstantSizeUI.l4,
          ),
          width: double.infinity,
          decoration: decoration,
          child: child,
        ),
        Positioned(
          right: ConstantSizeUI.l2,
          top: ConstantSizeUI.l2,
          child: CircleAvatar(
            radius: 12,
            backgroundColor: ConstantColor.iconBackGround,
            child: IconButton(
              iconSize: ConstantSizeUI.l3,
              padding: const EdgeInsets.all(0),
              icon: const Icon(
                Icons.close,
                color: ConstantColor.iconDark,
              ),
              onPressed: () {
                onClickRemove();
              },
              splashRadius: 0.1,
            ),
          ),
        ),
      ],
    );
  }
}
