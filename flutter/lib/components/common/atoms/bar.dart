import 'package:flutter/material.dart';

/// 線
class Bar extends StatelessWidget {
  const Bar({
    super.key,
    required this.color,
  });

  /// 文字
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 1,
      thickness: 1,
      color: color,
    );
  }
}
