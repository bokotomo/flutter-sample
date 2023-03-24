import 'package:flutter/material.dart';
import 'package:gamer_reflection/modules/const/color/base.dart'
    show ConstantColor;
import 'package:gamer_reflection/components/common/molecules/header.dart'
    show Header;

/// レイアウト: 基本
class BaseLayout extends StatelessWidget {
  const BaseLayout({
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
    return Scaffold(
      backgroundColor: ConstantColor.content,
      appBar: Header(title: title),
      body: GestureDetector(
        onTap: onTap,
        child: child,
      ),
    );
  }
}
