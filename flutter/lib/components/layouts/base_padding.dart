import 'package:flutter/material.dart'
    show
        StatelessWidget,
        Widget,
        BuildContext,
        Padding,
        EdgeInsets,
        Scaffold,
        GestureDetector,
        Container,
        BoxDecoration,
        DecorationImage,
        AssetImage,
        BoxFit;
import 'package:gamer_reflection/modules/const/color/base.dart'
    show ConstantColor;
import 'package:gamer_reflection/modules/const/size.dart' show ConstantSizeUI;
import 'package:gamer_reflection/components/common/molecules/header.dart'
    show Header;

/// レイアウト: 基本パディング
class BaseLayoutPadding extends StatelessWidget {
  const BaseLayoutPadding({
    super.key,
    required this.child,
    required this.title,
    required this.isBackGround,
    this.onTap,
  });

  /// コンテンツ
  final Widget child;

  /// タイトル
  final String title;

  /// 背景あり
  final bool isBackGround;

  /// 外部を押した
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final padding = Padding(
      padding: const EdgeInsets.only(
        left: ConstantSizeUI.l3,
        right: ConstantSizeUI.l3,
      ),
      child: child,
    );
    final backGroundBody = Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/backGroundIcons.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: padding,
    );

    return Scaffold(
      backgroundColor: ConstantColor.content,
      appBar: Header(title: title),
      body: GestureDetector(
        onTap: onTap,
        child: isBackGround ? backGroundBody : padding,
      ),
    );
  }
}
