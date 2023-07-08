import 'package:flutter/material.dart'
    show StatelessWidget, Widget, BuildContext;
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;
import 'package:gamer_reflection/components/common/molecules/button_period_filter/view.dart'
    show view;
import 'package:gamer_reflection/components/common/molecules/button_period_filter/type.dart'
    show Period;

/// 期間を選択するボタンの一覧
class ButtonPeriodFilter extends StatelessWidget {
  const ButtonPeriodFilter({
    super.key,
    required this.i18n,
    required this.period,
    required this.onPressedAll,
    required this.onPressedThreeMonth,
    required this.onPressedMonth,
  });

  /// 言語
  final AppLocalizations i18n;

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
      i18n,
      period,
      onPressedAll,
      onPressedThreeMonth,
      onPressedMonth,
    );
  }
}
