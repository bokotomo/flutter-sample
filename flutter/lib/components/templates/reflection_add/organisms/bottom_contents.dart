import 'package:flutter/material.dart';
import 'package:gamer_reflection/components/common/atoms/input_text.dart'
    show InputText;
import 'package:gamer_reflection/components/common/atoms/button_basic.dart'
    show ButtonBasic;
import 'package:gamer_reflection/components/common/atoms/button_done.dart'
    show ButtonDone;
import 'package:gamer_reflection/components/common/atoms/spacer_height.dart'
    show SpacerHeight;
import 'package:gamer_reflection/components/common/atoms/spacer_width.dart'
    show SpacerWidth;
import 'package:gamer_reflection/modules/const/size.dart' show ConstantSizeUI;
import 'package:gamer_reflection/modules/const/color.dart' show ConstantColor;

/// 振り返り名候補一覧
class BottomContents extends StatelessWidget {
  const BottomContents({
    super.key,
    required this.textFieldFocusNode,
    required this.textReflection,
    required this.onPressedReflectionDone,
    required this.onPressedAddReflection,
  });

  ///
  final FocusNode textFieldFocusNode;

  ///
  final TextEditingController textReflection;

  /// 振り返りの終了を押した
  final void Function() onPressedReflectionDone;

  /// 振り返りの追加を押した
  final void Function() onPressedAddReflection;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SpacerHeight.s,
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: ConstantSizeUI.l2,
          ),
          child: ButtonDone(
            text: '振り返りを終える',
            onPressed: () => onPressedReflectionDone(),
          ),
        ),
        SpacerHeight.s,
        Container(
          color: ConstantColor.footer,
          padding: const EdgeInsets.all(ConstantSizeUI.l2),
          child: Row(
            children: [
              Expanded(
                child: InputText(
                  text: textReflection,
                  hintText: '振り返りを書く(30文字以内)',
                  focusNode: textFieldFocusNode,
                  maxLength: 30,
                ),
              ),
              SpacerWidth.m,
              SizedBox(
                width: 80,
                child: ButtonBasic(
                  text: '追加',
                  onPressed: () => onPressedAddReflection(),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}