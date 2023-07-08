import 'package:flutter/material.dart'
    show
        AppBar,
        Widget,
        Text,
        TextStyle,
        Colors,
        BuildContext,
        ValueNotifier,
        PreferredSizeWidget,
        Size,
        IconButton,
        Icon,
        Icons,
        SizedBox,
        Padding,
        EdgeInsets;
import 'package:badges/badges.dart' as badges;
import 'package:flutter_hooks/flutter_hooks.dart'
    show HookWidget, useEffect, useState;
import 'package:gamer_reflection/components/common/atoms/button/done_menu.dart'
    show ButtonDoneMenu;
import 'package:gamer_reflection/components/common/atoms/button/basic.dart'
    show ButtonBasic;
import 'package:gamer_reflection/components/common/atoms/text/basic.dart'
    show BasicText;
import 'package:gamer_reflection/modules/const/color/base.dart'
    show useColorBase;
import 'package:gamer_reflection/modules/const/size.dart' show ConstantSizeUI;

/// ヘッダー
class Header extends HookWidget implements PreferredSizeWidget {
  const Header({
    super.key,
    required this.title,
    this.onClickRightMenu,
    this.onClickDoneButton,
    this.onClickHistory,
    this.badgeNumForListener,
  });

  /// ヘッダータイトル
  final String title;

  /// バッジの数
  final ValueNotifier<int>? badgeNumForListener;

  /// 右のハンバーガーメニューをクリックした
  final void Function()? onClickRightMenu;

  /// メニューの完了ボタンをクリックした
  final void Function()? onClickDoneButton;

  /// メニューの履歴ボタンをクリックした
  final void Function()? onClickHistory;

  /// 高さのサイズ
  @override
  Size get preferredSize => const Size.fromHeight(ConstantSizeUI.l7);

  @override
  AppBar build(BuildContext context) {
    final u = useColorBase();
    final ValueNotifier<int> badgeNum = useState<int>(0);

    /// 外部で候補一覧が更新されたら実行
    void updateBadge() {
      badgeNum.value = badgeNumForListener!.value;
    }

    /// NOTE:
    /// バッジ番号のみをレンダリングさせたいのでListenerでイベント発火している。
    useEffect(() {
      if (badgeNumForListener == null) return;
      badgeNum.value = badgeNumForListener!.value;
      badgeNumForListener!.addListener(updateBadge);
      return;
    }, [badgeNumForListener]);

    /// 右上のアイコンを追加
    /// todo: リファクタ
    List<Widget> getActions() {
      if (onClickDoneButton != null) {
        return [
          Padding(
            padding: const EdgeInsets.only(
              top: ConstantSizeUI.l2,
              bottom: ConstantSizeUI.l2,
              right: ConstantSizeUI.l2,
            ),
            child: SizedBox(
              width: 80,
              child: ButtonDoneMenu(
                text: "完了", // TODO: 言語
                onPressed: onClickDoneButton,
              ),
            ),
          ),
        ];
      }
      if (onClickHistory != null) {
        return [
          Padding(
            padding: const EdgeInsets.only(
              top: ConstantSizeUI.l2,
              bottom: ConstantSizeUI.l2,
              right: ConstantSizeUI.l2,
            ),
            child: SizedBox(
              width: 80,
              child: ButtonBasic(
                text: "履歴",
                onPressed: onClickHistory,
                isThin: true,
              ),
            ),
          ),
        ];
      }
      if (onClickRightMenu == null) return [];
      // 数字なしなら非表示
      if (badgeNum.value == 0) return [];

      //　数字付き
      return [
        badges.Badge(
          position: badges.BadgePosition.custom(top: 0, end: 2),
          badgeContent: Text(
            badgeNum.value.toString(),
            style: const TextStyle(color: Colors.white),
          ),
          child: IconButton(
            icon: const Icon(Icons.dehaze_sharp),
            onPressed: onClickRightMenu,
          ),
        ),
      ];
    }

    return AppBar(
      title: BasicText(
        text: title,
        size: "M",
      ),
      backgroundColor: u.header,
      actions: getActions(),
    );
  }
}
