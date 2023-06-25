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
        Icons;
import 'package:badges/badges.dart' as badges;
import 'package:flutter_hooks/flutter_hooks.dart'
    show HookWidget, useEffect, useState;
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
    this.badgeNumForListener,
  });

  /// ヘッダータイトル
  final String title;

  /// バッジの数
  final ValueNotifier<int>? badgeNumForListener;

  /// バッジの初期数
  // final int? badgeDefaultNum;

  /// 右のメニューをクリックした
  final void Function()? onClickRightMenu;

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
    List<Widget> getActions() {
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
