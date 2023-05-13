import 'package:flutter/material.dart'
    show AppBar, BuildContext, PreferredSizeWidget, Size;
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
  });

  /// ヘッダータイトル
  final String title;

  /// 高さのサイズ
  @override
  Size get preferredSize => const Size.fromHeight(ConstantSizeUI.l7);

  @override
  AppBar build(BuildContext context) {
    final u = useColorBase();

    return AppBar(
      title: BasicText(
        text: title,
        size: "M",
      ),
      backgroundColor: u.header,
    );
  }
}
