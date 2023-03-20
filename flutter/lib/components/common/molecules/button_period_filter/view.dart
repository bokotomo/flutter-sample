import 'package:flutter/material.dart'
    show Widget, ButtonBar, MainAxisAlignment;
import 'package:gamer_reflection/components/common/atoms/button_period.dart'
    show ButtonPeriod;
import 'package:gamer_reflection/components/common/atoms/spacer_width.dart'
    show SpacerWidth;

///
Widget view(
  int index,
  Function() onPressedAll,
  Function() onPressedThreeMonth,
  Function() onPressedMonth,
) {
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
