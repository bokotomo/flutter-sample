import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;
import 'package:flutter_hooks/flutter_hooks.dart' show HookWidget;
import 'package:gamer_reflection/components/common/molecules/header.dart'
    show Header;
import 'package:gamer_reflection/modules/const/color/base.dart'
    show useColorBase;

/// レイアウト: 基本
class BaseLayout extends HookWidget {
  const BaseLayout({
    super.key,
    required this.i18n,
    required this.child,
    required this.title,
    required this.isBackGround,
    this.onTap,
    this.badgeNumForListener,
    this.onClickRightMenu,
    this.onClickDoneButton,
    this.onWillPop,
  });

  /// 言語
  final AppLocalizations i18n;

  /// コンテンツ
  final Widget child;

  /// タイトル
  final String title;

  /// バッジの数
  final ValueNotifier<int>? badgeNumForListener;

  /// 背景あり
  final bool isBackGround;

  /// 外部を押した
  final void Function()? onTap;

  /// 右のメニューをクリックした
  final void Function()? onClickRightMenu;

  /// メニューの完了ボタンをクリックした
  final void Function()? onClickDoneButton;

  /// 戻る時のアクション
  final Future<bool> Function()? onWillPop;

  @override
  Widget build(BuildContext context) {
    final color = useColorBase();

    final backGroundBody = Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/backGroundIcons.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: child,
    );

    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        backgroundColor: color.content,
        appBar: Header(
          i18n: i18n,
          title: title,
          badgeNumForListener: badgeNumForListener,
          onClickRightMenu: onClickRightMenu,
          onClickDoneButton: onClickDoneButton,
        ),
        body: GestureDetector(
          onTap: onTap,
          child: isBackGround ? backGroundBody : child,
        ),
      ),
    );
  }
}
