import 'package:flutter/material.dart'
    show BuildContext, showDialog, Navigator, StatefulBuilder;
import 'package:gamer_reflection/components/common/atoms/button_cancel.dart'
    show ButtonCancel;
import 'package:gamer_reflection/components/common/atoms/text_annotation.dart'
    show TextAnnotation;
import 'package:gamer_reflection/components/common/atoms/spacer_height.dart'
    show SpacerHeight;
import 'package:gamer_reflection/modules/const/color/base.dart'
    show ConstantColor;
import 'package:gamer_reflection/components/common/atoms/button_done.dart'
    show ButtonDone;
import 'package:gamer_reflection/components/common/modal/base.dart'
    show ModalBase;

///
void showModal(
  BuildContext context,
  void Function() onPressedTaskDone,
) {
  showDialog(
    barrierColor: ConstantColor.modalBackground,
    context: context,
    builder: (BuildContext contextBuilder) {
      return StatefulBuilder(
        builder: (BuildContext contextStatefulBuilder, _) => ModalBase(
          title: "このタスクを完了しますか？",
          children: [
            const TextAnnotation(
              text: "一覧から削除されます。",
              size: "M",
            ),
            SpacerHeight.m,
            ButtonDone(
              text: "完了する",
              onPressed: () => {
                onPressedTaskDone(),
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
