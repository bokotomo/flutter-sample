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

  /// 右のメニューをクリックした
  final void Function()? onClickRightMenu;

  /// 高さのサイズ
  @override
  Size get preferredSize => const Size.fromHeight(ConstantSizeUI.l7);

  @override
  AppBar build(BuildContext context) {
    final u = useColorBase();

    // final ValueNotifier<int> badgeNum = useState<int>(0);

    /// 外部で候補一覧が更新されたら実行
    // void updateBadge() {
    //   print("okoko");
    //   print(badgeNumForListener!.value);
    //   badgeNum.value = badgeNumForListener!.value;
    // }

    /// NOTE:
    /// バッジ番号のみをレンダリングさせたいのでListenerでイベント発火している。
    // useEffect(() {
    //   if (badgeNumForListener == null) return;
    //   print("ともの");
    //   print(badgeNumForListener!.value);
    //   badgeNumForListener!.addListener(updateBadge);
    //   return;
    // }, []);

    // if (badgeNumForListener != null) {
    //   print("ともの");
    //   print(badgeNumForListener!.value);
    //   badgeNumForListener!.addListener(updateBadge);
    // }

    /// 右上のアイコンを追加
    List<Widget> getActions() {
      return [];
      // if (onClickRightMenu == null) return [];
      // // 数字なし
      // if (badgeNum.value == 0) {
      //   return [
      //     IconButton(
      //       icon: const Icon(Icons.dehaze_sharp),
      //       onPressed: onClickRightMenu,
      //     ),
      //   ];
      // }

      // //　数字付き
      // return [
      //   badges.Badge(
      //     position: badges.BadgePosition.custom(top: 0, end: 2),
      //     badgeContent: Text(
      //       badgeNum.value.toString(),
      //       style: const TextStyle(color: Colors.white),
      //     ),
      //     child: IconButton(
      //       icon: const Icon(Icons.dehaze_sharp),
      //       onPressed: onClickRightMenu,
      //     ),
      //   ),
      // ];
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
