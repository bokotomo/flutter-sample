import 'package:flutter/material.dart'
    show BuildContext, Color, Icons, showDialog, Navigator;
import 'package:gamer_reflection/components/common/atoms/button_cancel.dart'
    show ButtonCancel;
import 'package:gamer_reflection/components/common/atoms/text.dart'
    show BasicText;
import 'package:gamer_reflection/components/common/atoms/spacer_height.dart'
    show SpacerHeight;
import 'package:gamer_reflection/components/common/atoms/button_icon.dart'
    show ButtonIcon;
import 'package:gamer_reflection/components/common/modal/base.dart'
    show ModalBase;

///
void showModal(
  BuildContext context,
  String title,
  void Function() onPressed,
) {
  showDialog(
    barrierColor: const Color.fromARGB(170, 0, 0, 0),
    context: context,
    builder: (context) {
      return ModalBase(
        title: title,
        children: [
          const BasicText(
            text: "種類",
            size: "M",
          ),
          SpacerHeight.m,
          const BasicText(
            text: "良かったこと悪かったこと",
            size: "M",
          ),
          SpacerHeight.m,
          ButtonIcon(
            icon: Icons.add,
            text: "追加する",
            onPressed: () => {
              onPressed(),
              Navigator.pop(context),
            },
          ),
          SpacerHeight.m,
          ButtonCancel(
            text: "キャンセル",
            onPressed: () => {
              Navigator.pop(context),
            },
          ),
          SpacerHeight.m,
        ],
      );
    },
  );
}
