import 'package:flutter/material.dart';
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
    this.onTap,
  });

  /// コンテンツ
  final Widget child;

  /// タイトル
  final String title;

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

    return Scaffold(
      backgroundColor: ConstantColor.content,
      appBar: Header(title: title),
      body: GestureDetector(
        onTap: onTap,
        child: padding,
      ),
    );
  }
}
