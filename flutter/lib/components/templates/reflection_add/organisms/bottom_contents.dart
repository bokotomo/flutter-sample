import 'package:flutter/material.dart'
    show
        Widget,
        BuildContext,
        FocusNode,
        TextEditingController,
        Column,
        CrossAxisAlignment,
        Padding,
        EdgeInsets,
        Container,
        Row,
        Expanded,
        SizedBox,
        Builder;
import 'package:flutter_hooks/flutter_hooks.dart' show HookWidget;
import 'package:gamer_reflection/components/common/atoms/input/text_tap_region/widget.dart'
    show InputTextTapRegion;
import 'package:gamer_reflection/components/common/atoms/button/basic.dart'
    show ButtonBasic;
import 'package:gamer_reflection/components/common/atoms/button/done.dart'
    show ButtonDone;
import 'package:gamer_reflection/components/common/atoms/spacer/height.dart'
    show SpacerHeight;
import 'package:gamer_reflection/components/common/atoms/spacer/width.dart'
    show SpacerWidth;
import 'package:gamer_reflection/modules/const/size.dart' show ConstantSizeUI;
import 'package:gamer_reflection/modules/const/color/base.dart'
    show ConstantColor;

Widget view(
  BuildContext context,
  FocusNode textFieldFocusNode,
  TextEditingController textReflection,
  void Function() onPressedReflectionDone,
  void Function(BuildContext) onPressedAddReflection,
  void Function() onPressedRemoveText,
  void Function(String?) onChangeTextReflection,
) {
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
              child: InputTextTapRegion(
                autofocus: true,
                text: textReflection,
                hintText: '振り返りを書く',
                focusNode: textFieldFocusNode,
                maxLength: 30,
                onChanged: onChangeTextReflection,
                onPressedRemove: onPressedRemoveText,
              ),
            ),
            SpacerWidth.m,
            SizedBox(
              width: 80,
              child: ButtonBasic(
                text: '追加',
                onPressed: () => onPressedAddReflection(context),
              ),
            ),
          ],
        ),
      )
    ],
  );
}

/// 振り返り名候補一覧
class BottomContents extends HookWidget {
  const BottomContents({
    super.key,
    required this.textFieldFocusNode,
    required this.textReflection,
    required this.onPressedReflectionDone,
    required this.onPressedAddReflection,
    required this.onPressedRemoveText,
    required this.onChangeTextReflection,
  });

  ///
  final FocusNode textFieldFocusNode;

  ///
  final TextEditingController textReflection;

  /// 振り返りの終了を押した
  final void Function() onPressedReflectionDone;

  /// 振り返りの追加を押した
  final void Function(BuildContext) onPressedAddReflection;

  /// 振り返りの入力文字を削除
  final void Function() onPressedRemoveText;

  /// 振り返りのinputへの入力
  final void Function(String?) onChangeTextReflection;

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return view(
          context,
          textFieldFocusNode,
          textReflection,
          onPressedReflectionDone,
          onPressedAddReflection,
          onPressedRemoveText,
          onChangeTextReflection,
        );
      },
    );
  }
}
