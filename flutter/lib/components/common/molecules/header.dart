import 'package:flutter/material.dart';
import 'package:gamer_reflection/components/common/atoms/text.dart'
    show BasicText;
import 'package:gamer_reflection/modules/const/color.dart' show ConstantColor;
import 'package:gamer_reflection/modules/const/size.dart' show ConstantSizeUI;

/// ヘッダー
class Header extends StatelessWidget with PreferredSizeWidget {
  const Header({
    super.key,
    required this.title,
  });
  final String title;

  /// 高さのサイズ
  @override
  Size get preferredSize => const Size.fromHeight(ConstantSizeUI.l7);

  @override
  AppBar build(BuildContext context) {
    return AppBar(
      title: BasicText(
        text: title,
        size: "M",
      ),
      backgroundColor: ConstantColor.header,
    );
  }
}
