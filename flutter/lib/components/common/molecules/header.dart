import 'package:flutter/material.dart';
import 'package:gamer_reflection/components/common/atoms/text.dart'
    show BasicText;
import 'package:gamer_reflection/modules/const/color.dart' show ConstantColor;

/// ヘッダー
class Header extends StatelessWidget with PreferredSizeWidget {
  const Header({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: BasicText(
        text: title,
        size: "M",
      ),
      backgroundColor: ConstantColor.header,
    );
  }
}
