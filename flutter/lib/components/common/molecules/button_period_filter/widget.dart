import 'package:flutter/material.dart'
    show StatelessWidget, Widget, BuildContext;
import 'package:gamer_reflection/components/common/molecules/button_period_filter/view.dart'
    show view;
import 'package:gamer_reflection/components/common/molecules/button_period_filter/type.dart'
    show Period;

/// 期間を選択するボタンの一覧
class ButtonPeriodFilter extends StatelessWidget {
  const ButtonPeriodFilter({
    super.key,
    required this.period,
    required this.onPressedAll,
    required this.onPressedThreeMonth,
    required this.onPressedMonth,
  });

  /// 選択しているボタン
  final Period period;

  /// 全期間をクリックした
  final void Function() onPressedAll;

  /// 3ヶ月をクリックした
  final void Function() onPressedThreeMonth;

  /// 1ヶ月をクリックした
  final void Function() onPressedMonth;

  @override
  Widget build(BuildContext context) {
    return view(
      period,
      onPressedAll,
      onPressedThreeMonth,
      onPressedMonth,
    );
  }
}
