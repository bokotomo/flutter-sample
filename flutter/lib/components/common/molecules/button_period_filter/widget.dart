import 'package:flutter/material.dart';
import 'package:gamer_reflection/components/common/molecules/button_period_filter/view.dart'
    show view;
import 'package:gamer_reflection/components/common/molecules/button_period_filter/type.dart'
    show Period;

/// 期間を選択するボタンの一覧
class ButtonPeriodFilter extends StatelessWidget {
  const ButtonPeriodFilter({
    super.key,
    required this.period,
    this.onPressedAll,
    this.onPressedThreeMonth,
    this.onPressedMonth,
  });

  /// 選択しているボタン
  final Period period;

  /// 全期間をクリックした
  final void Function()? onPressedAll;

  /// 3ヶ月をクリックした
  final void Function()? onPressedThreeMonth;

  /// 1ヶ月をクリックした
  final void Function()? onPressedMonth;

  @override
  Widget build(BuildContext context) {
    /// 全期間
    void onPressedAll() {
      if (this.onPressedAll == null) return;
      this.onPressedAll!();
    }

    /// 3ヶ月
    void onPressedThreeMonth() {
      if (this.onPressedThreeMonth == null) return;
      this.onPressedThreeMonth!();
    }

    /// 1ヶ月
    void onPressedMonth() {
      if (this.onPressedMonth == null) return;
      this.onPressedMonth!();
    }

    return view(
      period,
      onPressedAll,
      onPressedThreeMonth,
      onPressedMonth,
    );
  }
}
