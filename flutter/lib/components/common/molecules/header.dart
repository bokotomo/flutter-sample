// import 'package:flutter/material.dart'
//     show
//         AppBar,
//         BuildContext,
//         PreferredSizeWidget,
//         Size,
//         IconButton,
//         Icon,
//         Icons;
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter_hooks/flutter_hooks.dart' show HookWidget;
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
    this.badgeNum,
  });

  /// ヘッダータイトル
  final String title;

  /// バッジの数
  final int? badgeNum;

  /// 右のメニューをクリックした
  final void Function()? onClickRightMenu;

  /// 高さのサイズ
  @override
  Size get preferredSize => const Size.fromHeight(ConstantSizeUI.l7);

  @override
  AppBar build(BuildContext context) {
    final u = useColorBase();

    /// 右上のアイコンを追加
    List<badges.Badge> getActions() {
      if (onClickRightMenu == null) return [];

      return [
        badges.Badge(
          position: badges.BadgePosition.custom(top: 0, end: 2),
          badgeContent: Text(
            (badgeNum == null ? "" : badgeNum.toString()),
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
