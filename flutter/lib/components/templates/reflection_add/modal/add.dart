import 'package:flutter/material.dart'
    show BuildContext, Color, Icons, showDialog, Navigator, StatefulBuilder;
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
    builder: (contextBuilder) {
      String groupValue = "good";

      return StatefulBuilder(
        builder: (contextStatefulBuilder, setState) => ModalBase(
          title: title,
          children: [
            const BasicText(
              text: "分類",
              size: "M",
            ),
            if (!textExist) SpacerHeight.m,
            if (!textExist)
              RadioGoodBadButton(
                groupValue: groupValue,
                onChangedGood: (v) => {
                  setState(() {
                    groupValue = v ?? "";
                  }),
                  onChangedGood(),
                },
                onChangedBad: (v) => {
                  setState(() {
                    groupValue = v ?? "";
                  }),
                  onChangedBad(),
                },
              ),
            SpacerHeight.m,
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
