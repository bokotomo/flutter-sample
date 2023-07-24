import 'package:flutter/material.dart'
    show
        StatelessWidget,
        Widget,
        BuildContext,
        ClipRRect,
        BorderRadius,
        Radius,
        LinearProgressIndicator,
        AlwaysStoppedAnimation;
import 'package:gamer_reflection/modules/const/color/gauge.dart'
    show ConstantColorGauge;

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
        valueColor: const AlwaysStoppedAnimation(ConstantColorGauge.gauge),
        backgroundColor: ConstantColorGauge.background,
        minHeight: 8,
      ),
    );
  }
}
