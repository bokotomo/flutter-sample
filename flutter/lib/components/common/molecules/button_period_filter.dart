import 'package:flutter/material.dart';
import 'package:gamer_reflection/components/common/atoms/button_period.dart'
    show ButtonPeriod;
import 'package:gamer_reflection/components/common/atoms/spacer_width.dart'
    show SpacerWidth;

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

  /// クリックした
  final void Function()? onPressedAll;

  /// クリックした
  final void Function()? onPressedThreeMonth;

  /// クリックした
  final void Function()? onPressedMonth;

  @override
  Widget build(BuildContext context) {
    /// クリックされた
    void onPressedAll() {
      if (this.onPressedAll == null) return;
      this.onPressedAll!();
    }

    /// クリックされた
    void onPressedThreeMonth() {
      if (this.onPressedThreeMonth == null) return;
      this.onPressedThreeMonth!();
    }

    /// クリックされた
    void onPressedMonth() {
      if (this.onPressedMonth == null) return;
      this.onPressedMonth!();
    }

    return ButtonBar(
      alignment: MainAxisAlignment.center,
      children: [
        ButtonPeriod(
          text: "全期間",
          isActive: index == 0,
          onPressed: onPressedAll,
        ),
        SpacerWidth.s,
        ButtonPeriod(
          text: "3ヶ月",
          isActive: index == 1,
          onPressed: onPressedThreeMonth,
        ),
        SpacerWidth.s,
        ButtonPeriod(
          text: "1ヶ月",
          isActive: index == 2,
          onPressed: onPressedMonth,
        ),
      ],
    );
  }
}
