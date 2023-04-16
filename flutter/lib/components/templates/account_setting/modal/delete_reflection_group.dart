import 'package:flutter/material.dart'
    show BuildContext, Color, Icons, showDialog, Navigator;
import 'package:gamer_reflection/components/common/atoms/button_cancel.dart'
    show ButtonCancel;
import 'package:gamer_reflection/components/common/atoms/text.dart'
    show BasicText;
import 'package:gamer_reflection/components/common/atoms/text_annotation.dart'
    show TextAnnotation;
import 'package:gamer_reflection/components/common/atoms/spacer_height.dart'
    show SpacerHeight;
import 'package:gamer_reflection/components/common/atoms/button_icon.dart'
    show ButtonIcon;
import 'package:gamer_reflection/components/common/modal/base.dart'
    show ModalBase;

///
void showDeleteModal(
  BuildContext context,
  String name,
  void Function(BuildContext) onPressed,
) {
  showDialog(
    barrierColor: const Color.fromARGB(170, 0, 0, 0),
    context: context,
    builder: (contextDialog) {
      return ModalBase(
        title: "振り返りの削除",
        children: [
          BasicText(
            text: name,
            size: "M",
          ),
          SpacerHeight.xs,
          const TextAnnotation(
            text: "振り返りした内容も削除されます。",
            size: "S",
          ),
          SpacerHeight.m,
          ButtonIcon(
            icon: Icons.delete,
            text: "削除する",
            onPressed: () => onPressed(contextDialog),
          ),
          SpacerHeight.m,
          ButtonCancel(
            text: "キャンセル",
            onPressed: () => Navigator.pop(contextDialog),
          ),
          SpacerHeight.m,
        ],
      );
    },
  );
}
