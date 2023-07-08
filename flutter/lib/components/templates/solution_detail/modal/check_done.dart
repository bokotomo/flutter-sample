import 'package:flutter/material.dart'
    show BuildContext, showDialog, Navigator, StatefulBuilder;
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;
import 'package:gamer_reflection/components/common/atoms/text/annotation.dart'
    show TextAnnotation;
import 'package:gamer_reflection/components/common/atoms/spacer/height.dart'
    show SpacerHeight;
import 'package:gamer_reflection/modules/const/color/base.dart'
    show ConstantColor;
import 'package:gamer_reflection/components/common/atoms/button/done.dart'
    show ButtonDone;
import 'package:gamer_reflection/components/common/atoms/button/cancel.dart'
    show ButtonCancel;
import 'package:gamer_reflection/components/common/modal/base.dart'
    show ModalBase;

///
void showModal(
  AppLocalizations i18n,
  BuildContext context,
  void Function() onPressedDone,
) {
  showDialog(
    barrierColor: ConstantColor.modalBackground,
    context: context,
    builder: (BuildContext contextBuilder) {
      return StatefulBuilder(
        builder: (BuildContext contextStatefulBuilder, _) => ModalBase(
          title: i18n.solutionDetailPageModalCheckTitle,
          children: [
            TextAnnotation(
              text: i18n.solutionDetailPageModalCheckAnnotation,
              size: "M",
            ),
            SpacerHeight.m,
            ButtonDone(
              text: i18n.solutionDetailPageModalCheckButtonDone,
              onPressed: () => {
                onPressedDone(),
                Navigator.pop(contextStatefulBuilder),
                Navigator.pop(context),
              },
            ),
            SpacerHeight.m,
            ButtonCancel(
              text: i18n.solutionDetailPageModalCheckButtonCancel,
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
