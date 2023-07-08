import 'package:flutter/material.dart'
    show BuildContext, showDialog, Navigator, StatefulBuilder;
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;
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
  AppLocalizations i18n,
  BuildContext context,
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
          title: i18n.reflectionAddPageModalConfirmTitle,
          children: [
            ButtonBasic(
              text: i18n.reflectionAddPageModalConfirmBack,
              onPressed: () => {
                Navigator.pop(contextStatefulBuilder),
                Navigator.pop(context),
              },
            ),
            SpacerHeight.m,
            ButtonCancel(
              text: i18n.reflectionAddPageModalConfirmCancel,
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
