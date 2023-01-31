import 'package:flutter/material.dart';
import 'package:gamer_reflection/components/common/atoms/text.dart' as text;
import 'package:gamer_reflection/modules/const/color.dart' as color;

const double headerSize = 20;

/// Header
class Header extends StatelessWidget with PreferredSizeWidget {
  const Header({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  //const Size(0.0, 0.0); //const Size.fromHeight(kToolbarHeight + headerSize);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: text.BasicText(
        text: title,
        size: "M",
      ),
      backgroundColor: color.barColor,
    );
  }
}
