import 'package:flutter/material.dart'
    show
        BuildContext,
        AlertDialog,
        Color,
        Icons,
        showDialog,
        Navigator,
        EdgeInsets,
        Column;
import 'package:flutter/widgets.dart';
import 'package:gamer_reflection/components/common/atoms/button_cancel.dart'
    show ButtonCancel;
import 'package:gamer_reflection/components/common/atoms/text.dart'
    show BasicText;
import 'package:gamer_reflection/modules/const/color/base.dart'
    show ConstantColor;
import 'package:gamer_reflection/modules/const/size.dart' show ConstantSizeUI;
import 'package:gamer_reflection/components/common/atoms/spacer_height.dart'
    show SpacerHeight;
import 'package:gamer_reflection/components/common/atoms/button_icon.dart'
    show ButtonIcon;

///
void showModal(
  BuildContext context,
  Function() onPressed,
) {
  showDialog(
    barrierColor: const Color.fromARGB(170, 0, 0, 0),
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: ConstantColor.box, //背景色
        title: const BasicText(
          text: '振り返り名の新規作成',
          size: "M",
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: ConstantSizeUI.l3,
        ),
        content: SizedBox(
          width: double.infinity - 0,
          height: 300,
          child: Column(
            children: [
              const BasicText(
                text: '中身',
                size: "M",
              ),
              SpacerHeight.m,
              ButtonIcon(
                icon: Icons.add,
                text: "新規で作成する",
                onPressed: () => onPressed,
              ),
              SpacerHeight.m,
              ButtonCancel(
                text: "キャンセル",
                onPressed: () => {
                  Navigator.pop(context),
                },
              ),
              SpacerHeight.m,
            ],
          ),
        ),
      );
    },
  );
}
