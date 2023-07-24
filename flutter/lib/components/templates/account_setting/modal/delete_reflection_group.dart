import 'package:flutter/material.dart' show BuildContext, showDialog, Navigator;
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;
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
import 'package:gamer_reflection/modules/const/color/base.dart'
    show ConstantColor;

///
void showDeleteModal(
  AppLocalizations i18n,
  BuildContext context,
  String name,
  void Function(BuildContext) onPressed,
) {
  showDialog(
    barrierColor: ConstantColor.modalBackground,
    context: context,
    builder: (contextDialog) {
      return ModalBase(
        title: i18n.accountPageModalDeleteTitle,
        children: [
          BasicText(
            text: name,
            size: "M",
          ),
          SpacerHeight.xs,
          TextAnnotation(
            text: i18n.accountPageModalDeleteSubTitle,
            size: "S",
          ),
          SpacerHeight.m,
          ButtonDelete(
            text: i18n.accountPageModalDeleteButtonDelete,
            onPressed: () => onPressed(contextDialog),
          ),
          SpacerHeight.m,
          ButtonCancel(
            text: i18n.accountPageModalDeleteCancel,
            onPressed: () => Navigator.pop(contextDialog),
          ),
          SpacerHeight.m,
        ],
      );
    },
  );
}
