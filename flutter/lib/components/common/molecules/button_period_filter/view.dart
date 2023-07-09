import 'package:flutter/material.dart' show Widget, Expanded, Row;
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;
import 'package:gamer_reflection/components/common/atoms/button/period.dart'
    show ButtonPeriod;
import 'package:gamer_reflection/components/common/atoms/spacer/width.dart'
    show SpacerWidth;
import 'package:gamer_reflection/components/common/molecules/button_period_filter/type.dart'
    show Period;

///
Widget view(
  AppLocalizations i18n,
  Period period,
  void Function() onPressedAll,
  void Function() onPressedThreeMonth,
  void Function() onPressedMonth,
) {
  return Row(
    children: [
      SpacerWidth.m,
      Expanded(
        child: ButtonPeriod(
          text: i18n.commonButtonPeriodFilterAll,
          isActive: period == Period.all,
          onPressed: onPressedAll,
        ),
      ),
      SpacerWidth.s,
      Expanded(
        child: ButtonPeriod(
          text: i18n.commonButtonPeriodFilterThreeMonth,
          isActive: period == Period.threeMonth,
          onPressed: onPressedThreeMonth,
        ),
      ),
      SpacerWidth.s,
      Expanded(
        child: ButtonPeriod(
          text: i18n.commonButtonPeriodFilteroOneMonth,
          isActive: period == Period.oneMonth,
          onPressed: onPressedMonth,
        ),
      ),
      SpacerWidth.m,
    ],
  );
}
