import 'package:flutter/material.dart'
    show BuildContext, Color, showDialog, Navigator;
import 'package:gamer_reflection/components/common/atoms/text/basic.dart'
    show BasicText;
import 'package:gamer_reflection/components/common/atoms/text/annotation.dart'
    show TextAnnotation;
import 'package:gamer_reflection/components/common/atoms/spacer/height.dart'
    show SpacerHeight;
import 'package:gamer_reflection/components/common/atoms/button/delete.dart'
    show ButtonDelete;
import 'package:gamer_reflection/components/common/atoms/button/cancel.dart'
    show ButtonCancel;
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
            text: "振り返りした内容も削除されます。\n復元はできません。",
            size: "S",
          ),
          SpacerHeight.m,
          ButtonDelete(
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
