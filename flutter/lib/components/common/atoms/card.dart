import 'package:flutter/material.dart';
import 'package:gamer_reflection/modules/const/color/base.dart'
    show ConstantColor;
import 'package:gamer_reflection/modules/const/size.dart' show ConstantSizeUI;

/// 削除ボタン付きコンテンツ
class Card extends StatelessWidget {
  const Card({
    super.key,
    required this.child,
    required this.onPressedRemove,
    required this.onPressed,
  });

  /// 文字
  final Widget child;

  /// クリックした
  final Function() onPressed;

  /// 削除ボタン
  final Function() onPressedRemove;

  @override
  Widget build(BuildContext context) {
    final style = ElevatedButton.styleFrom(
      backgroundColor: ConstantColor.box,
      padding: const EdgeInsets.only(
        top: ConstantSizeUI.l4,
        left: ConstantSizeUI.l3,
        bottom: ConstantSizeUI.l4,
        right: ConstantSizeUI.l4,
      ),
      minimumSize: const Size.fromHeight(ConstantSizeUI.l7),
      elevation: 1,
      alignment: Alignment.topLeft,
      shadowColor: ConstantColor.boxBorder,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(ConstantSizeUI.l1),
        side: const BorderSide(
          width: 1.0,
          color: ConstantColor.boxBorder,
        ),
      ),
    );

    return Stack(
      alignment: Alignment.topRight,
      children: [
        ElevatedButton(
          onPressed: onPressed,
          style: style,
          child: child,
        ),
        Positioned(
          right: ConstantSizeUI.l2,
          top: ConstantSizeUI.l2,
          child: CircleAvatar(
            radius: 8,
            backgroundColor: ConstantColor.iconBackGround,
            child: IconButton(
              iconSize: ConstantSizeUI.l3,
              padding: const EdgeInsets.all(0),
              icon: const Icon(
                Icons.close,
                color: ConstantColor.iconDark,
              ),
              onPressed: onPressedRemove,
              splashRadius: 0.1,
            ),
          ),
        ),
      ],
    );
  }
}
