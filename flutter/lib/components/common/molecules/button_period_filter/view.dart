import 'package:flutter/material.dart'
    show Widget, ButtonBar, MainAxisAlignment;
import 'package:gamer_reflection/components/common/atoms/button/period.dart'
    show ButtonPeriod;
import 'package:gamer_reflection/components/common/atoms/spacer/width.dart'
    show SpacerWidth;
import 'package:gamer_reflection/components/common/molecules/button_period_filter/type.dart'
    show Period;

///
Widget view(
  Period period,
  void Function() onPressedAll,
  void Function() onPressedThreeMonth,
  void Function() onPressedMonth,
) {
  return ButtonBar(
    alignment: MainAxisAlignment.center,
    children: [
      ButtonPeriod(
        text: "全期間", // TODO: 言語
        isActive: period == Period.all,
        onPressed: onPressedAll,
      ),
      SpacerWidth.s,
      ButtonPeriod(
        text: "3ヶ月",
        isActive: period == Period.threeMonth,
        onPressed: onPressedThreeMonth,
      ),
      SpacerWidth.s,
      ButtonPeriod(
        text: "1ヶ月",
        isActive: period == Period.oneMonth,
        onPressed: onPressedMonth,
      ),
    ],
  );
}
