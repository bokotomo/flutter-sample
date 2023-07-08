import 'package:flutter/material.dart'
    show BuildContext, Color, Icons, showDialog, Navigator;
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;
import 'package:gamer_reflection/components/common/atoms/button/cancel.dart'
    show ButtonCancel;
import 'package:gamer_reflection/components/common/atoms/text/basic.dart'
    show BasicText;
import 'package:gamer_reflection/components/common/atoms/spacer/height.dart'
    show SpacerHeight;
import 'package:gamer_reflection/components/common/atoms/button/icon.dart'
    show ButtonIcon;
import 'package:gamer_reflection/components/common/modal/base.dart'
    show ModalBase;

///
void showModal(
  AppLocalizations i18n,
  BuildContext context,
  String text,
  void Function(BuildContext) onPressed,
) {
  showDialog(
    barrierColor: const Color.fromARGB(170, 0, 0, 0),
    context: context,
    builder: (contextDialog) {
      return ModalBase(
        title: i18n.accountPageModalNewTitle,
        children: [
          BasicText(
            text: text,
            size: "M",
          ),
          SpacerHeight.m,
          ButtonIcon(
            icon: Icons.add,
            text: i18n.accountPageModalNewButtonAdd,
            onPressed: () => onPressed(contextDialog),
          ),
          SpacerHeight.m,
          ButtonCancel(
            text: i18n.accountPageModalNewCancel,
            onPressed: () => Navigator.pop(contextDialog),
          ),
          SpacerHeight.m,
        ],
      );
    },
  );
}
