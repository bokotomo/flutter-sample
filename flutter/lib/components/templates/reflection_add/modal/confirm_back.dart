import 'package:flutter/material.dart'
    show BuildContext, showDialog, Navigator, StatefulBuilder;
import 'package:gamer_reflection/components/common/atoms/spacer/height.dart'
    show SpacerHeight;
import 'package:gamer_reflection/modules/const/color/base.dart'
    show ConstantColor;
import 'package:gamer_reflection/components/common/atoms/button/basic.dart'
    show ButtonBasic;
import 'package:gamer_reflection/components/common/atoms/button/cancel.dart'
    show ButtonCancel;
import 'package:gamer_reflection/components/common/modal/base.dart'
    show ModalBase;

/// モーダル: 戻るのを確認
void showModalConfirmBack(
  BuildContext context,
  String title,
) {
  showDialog(
    barrierColor: ConstantColor.modalBackground,
    context: context,
    builder: (BuildContext contextBuilder) {
      return StatefulBuilder(
        builder: (
          BuildContext contextStatefulBuilder,
          void Function(void Function()) setState,
        ) =>
            ModalBase(
          title: title,
          children: [
            ButtonBasic(
              text: "戻る",
              onPressed: () => {
                Navigator.pop(contextStatefulBuilder),
                Navigator.pop(context),
              },
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
