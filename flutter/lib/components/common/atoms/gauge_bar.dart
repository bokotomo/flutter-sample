import 'package:flutter/material.dart'
    show
        StatelessWidget,
        Widget,
        BuildContext,
        ClipRRect,
        BorderRadius,
        Radius,
        LinearProgressIndicator,
        AlwaysStoppedAnimation,
        Color;

/// ゲージのバー
class GaugeBar extends StatelessWidget {
  const GaugeBar({
    super.key,
    required this.percent,
  });

  final double percent;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(100)),
      child: LinearProgressIndicator(
        value: percent,
        valueColor:
            const AlwaysStoppedAnimation(Color.fromARGB(255, 40, 88, 221)),
        backgroundColor: const Color.fromARGB(255, 197, 197, 213),
        minHeight: 8,
      ),
    );
  }
}
