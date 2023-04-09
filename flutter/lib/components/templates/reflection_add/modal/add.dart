import 'package:flutter/material.dart'
    show
        BuildContext,
        Color,
        Icons,
        showDialog,
        Navigator,
        StatefulBuilder,
        Widget,
        Column,
        CrossAxisAlignment;
import 'package:gamer_reflection/components/common/atoms/button_cancel.dart'
    show ButtonCancel;
import 'package:gamer_reflection/components/common/atoms/text.dart'
    show BasicText;
import 'package:gamer_reflection/components/common/atoms/spacer_height.dart'
    show SpacerHeight;
import 'package:gamer_reflection/components/common/atoms/radio_good_bad_button.dart'
    show RadioGoodBadButton;
import 'package:gamer_reflection/components/common/atoms/button_icon.dart'
    show ButtonIcon;
import 'package:gamer_reflection/components/common/modal/base.dart'
    show ModalBase;

Widget reflectionTypeButton(
  String groupValue,
  void Function(String?) onChangedGood,
  void Function(String?) onChangedBad,
) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const BasicText(
        text: "分類",
        size: "M",
      ),
      SpacerHeight.m,
      RadioGoodBadButton(
        groupValue: groupValue,
        onChangedGood: onChangedGood,
        onChangedBad: onChangedBad,
      ),
      SpacerHeight.m,
    ],
  );
}

///
void showModal(
  BuildContext context,
  String title,
  bool textExist,
  void Function(BuildContext) onPressedAdd,
  void Function() onChangedGood,
  void Function() onChangedBad,
) {
  showDialog(
    barrierColor: const Color.fromARGB(170, 0, 0, 0),
    context: context,
    builder: (BuildContext contextBuilder) {
      String groupValue = "good";

      return StatefulBuilder(
        builder: (
          BuildContext contextStatefulBuilder,
          void Function(void Function()) setState,
        ) =>
            ModalBase(
          title: title,
          children: [
            if (!textExist)
              reflectionTypeButton(
                groupValue,
                (v) => {
                  setState(() {
                    groupValue = v ?? "";
                  }),
                  onChangedGood(),
                },
                (v) => {
                  setState(() {
                    groupValue = v ?? "";
                  }),
                  onChangedBad(),
                },
              ),
            ButtonIcon(
              icon: Icons.add,
              text: "追加する",
              onPressed: () => onPressedAdd(contextStatefulBuilder),
            ),
            SpacerHeight.m,
            ButtonCancel(
              text: "キャンセル",
              onPressed: () => {
                Navigator.pop(contextStatefulBuilder),
              },
            ),
            SpacerHeight.m,
          ],
        ),
      );
    },
  );
}
