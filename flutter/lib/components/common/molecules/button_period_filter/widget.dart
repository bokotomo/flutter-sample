import 'package:flutter/material.dart';
import 'package:gamer_reflection/components/common/molecules/button_period_filter/view.dart'
    show view;

/// 期間を選択するボタンの一覧
class ButtonPeriodFilter extends StatelessWidget {
  const ButtonPeriodFilter({
    super.key,
    required this.index,
    this.onPressedAll,
    this.onPressedThreeMonth,
    this.onPressedMonth,
  });

  /// 選択しているボタン
  final int index;

  /// 全期間をクリックした
  final void Function()? onPressedAll;

  /// 3ヶ月をクリックした
  final void Function()? onPressedThreeMonth;

  /// 1ヶ月をクリックした
  final void Function()? onPressedMonth;

  @override
  Widget build(BuildContext context) {
    return view(
      index,
      onPressedAll,
      onPressedThreeMonth,
      onPressedMonth,
    );
  }
}
