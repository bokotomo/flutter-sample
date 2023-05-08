import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart' show HookWidget;
import 'package:gamer_reflection/modules/const/color/base.dart'
    show ConstantColor;
import 'package:gamer_reflection/components/common/molecules/header.dart'
    show Header;
import 'package:gamer_reflection/modules/const/color/base.dart'
    show useColorBase;

/// レイアウト: 基本
class BaseLayout extends HookWidget {
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
    final u = useColorBase();

    return Scaffold(
      backgroundColor: u.content,
      appBar: Header(title: title),
      body: GestureDetector(
        onTap: onTap,
        child: child,
      ),
    );
  }
}
