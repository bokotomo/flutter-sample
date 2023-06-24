import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart' show HookWidget;
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
    this.badgeNumForListener,
    this.onClickRightMenu,
  });

  /// コンテンツ
  final Widget child;

  /// タイトル
  final String title;

  /// バッジの数
  final ValueNotifier<int>? badgeNumForListener;

  /// 外部を押した
  final void Function()? onTap;

  /// 右のメニューをクリックした
  final void Function()? onClickRightMenu;

  @override
  Widget build(BuildContext context) {
    final u = useColorBase();

    return Scaffold(
      backgroundColor: u.content,
      appBar: Header(
        title: title,
        badgeNumForListener: badgeNumForListener,
        onClickRightMenu: onClickRightMenu,
      ),
      body: GestureDetector(
        onTap: onTap,
        child: child,
      ),
    );
  }
}
