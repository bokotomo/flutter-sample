import 'package:flutter/material.dart'
    show
        Widget,
        BuildContext,
        ListView,
        Column,
        Icons,
        TextEditingController,
        FocusNode;
import 'package:gamer_reflection/components/common/atoms/input_text/widget.dart'
    show InputText;
import 'package:gamer_reflection/components/layouts/base.dart' show BaseLayout;
import 'package:gamer_reflection/components/common/atoms/text.dart'
    show BasicText;
import 'package:gamer_reflection/components/common/atoms/button/icon.dart'
    show ButtonIcon;
import 'package:gamer_reflection/components/common/atoms/box.dart' show Box;
import 'package:gamer_reflection/components/common/atoms/spacer/height.dart'
    show SpacerHeight;

/// 見た目
Widget view(
  BuildContext context,
  TextEditingController textReflection,
  FocusNode textFieldFocusNode,
) {
  ListView cloumn = ListView(
    children: [
      const BasicText(
        size: "XM",
        text: "振り返り名を決めましょう！",
      ),
      SpacerHeight.m,
      const BasicText(
        size: "M",
        text: "キャラ/武器/ポジションを別々で振り返るために必要です。",
      ),
      SpacerHeight.m,
      Box(
        child: Column(children: [
          const BasicText(
            size: "M",
            text: "振り返り名 (20文字まで)",
          ),
          SpacerHeight.m,
          const BasicText(
            size: "M",
            text: "※後で変更できます。",
          ),
          SpacerHeight.m,
          const ButtonIcon(
            icon: Icons.add,
            text: "登録する",
            // onPressed: () => {},
          ),
          SpacerHeight.m,
          InputText(
            text: textReflection,
            hintText: '振り返りを書く',
            focusNode: textFieldFocusNode,
            maxLength: 30,
          ),
        ]),
      )
    ],
  );

  return BaseLayout(
    title: "振り返り名の追加",
    child: cloumn,
  );
}
