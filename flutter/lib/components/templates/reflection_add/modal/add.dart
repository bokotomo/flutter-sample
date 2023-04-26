import 'package:flutter/material.dart'
    show
        BuildContext,
        Icons,
        showDialog,
        Navigator,
        StatefulBuilder,
        Widget,
        Column,
        CrossAxisAlignment;
import 'package:gamer_reflection/components/common/atoms/text/basic.dart'
    show BasicText;
import 'package:gamer_reflection/components/common/atoms/spacer/height.dart'
    show SpacerHeight;
import 'package:gamer_reflection/components/common/molecules/radio_good_bad_button.dart'
    show RadioGoodBadButton;
import 'package:gamer_reflection/modules/const/color/base.dart'
    show ConstantColor;
import 'package:gamer_reflection/components/common/atoms/button/icon.dart'
    show ButtonIcon;
import 'package:gamer_reflection/components/common/atoms/button/cancel.dart'
    show ButtonCancel;
import 'package:gamer_reflection/components/common/modal/base.dart'
    show ModalBase;

/// 新規振り返りの場合
Widget reflectionTypeButton(
  String groupValue,
  void Function(String?) onChangedGood,
  void Function(String?) onChangedBad,
) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const BasicText(
        text: "振り返りの分類",
        size: "M",
      ),
      SpacerHeight.s,
      RadioGoodBadButton(
        groupValue: groupValue,
        onChangedGood: onChangedGood,
        onChangedBad: onChangedBad,
      ),
    ],
  );
}

/// すでに同じ振り返りがある場合
Widget reflectionCount(int count) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const BasicText(
        text: "発生した回数",
        size: "M",
      ),
      SpacerHeight.s,
      BasicText(
        text: "$count回",
        size: "M",
      ),
    ],
  );
}

///
void showModal(
  BuildContext context,
  String title,
  bool candidateExist,
  int count,
  void Function(BuildContext) onPressedAdd,
  void Function() onChangedGood,
  void Function() onChangedBad,
) {
  showDialog(
    barrierColor: ConstantColor.modalBackground,
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
            // 新規追加
            if (!candidateExist)
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
            // すでに追加したもの
            if (candidateExist) reflectionCount(count),
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
