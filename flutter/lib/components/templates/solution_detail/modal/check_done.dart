import 'package:flutter/material.dart'
    show BuildContext, showDialog, Navigator, StatefulBuilder;
import 'package:gamer_reflection/modules/const/color/hooks.dart' show UseColor;
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;
import 'package:gamer_reflection/components/common/atoms/text/annotation.dart'
    show TextAnnotation;
import 'package:gamer_reflection/components/common/atoms/spacer/height.dart'
    show SpacerHeight;
import 'package:gamer_reflection/components/common/atoms/button/done.dart'
    show ButtonDone;
import 'package:gamer_reflection/components/common/atoms/button/cancel.dart'
    show ButtonCancel;
import 'package:gamer_reflection/components/common/modal/base.dart'
    show ModalBase;

///
void showModalDone(
  AppLocalizations i18n,
  UseColor color,
  BuildContext context,
  void Function() onPressedDone,
) {
  showDialog(
    barrierColor: color.base.modalBackground,
    context: context,
    builder: (BuildContext contextBuilder) {
      return StatefulBuilder(
        builder: (BuildContext contextStatefulBuilder, _) => ModalBase(
          color: color,
          title: i18n.solutionDetailPageModalCheckTitle,
          children: [
            TextAnnotation(
              color: color,
              text: i18n.solutionDetailPageModalCheckAnnotation,
              size: "M",
            ),
            SpacerHeight.m,
            ButtonDone(
              color: color,
              text: i18n.solutionDetailPageModalCheckButtonDone,
              onPressed: () => {
                onPressedDone(),
                Navigator.pop(contextStatefulBuilder),
                Navigator.pop(context),
              },
            ),
            SpacerHeight.m,
            ButtonCancel(
              color: color,
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
