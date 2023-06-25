import 'package:flutter/material.dart'
    show
        StatelessWidget,
        Widget,
        BuildContext,
        BoxDecoration,
        Border,
        Expanded,
        Icon,
        Icons,
        IconButton,
        CircleAvatar,
        EdgeInsets,
        Row,
        Container;
import 'package:gamer_reflection/components/common/atoms/text/basic.dart'
    show BasicText;
import 'package:gamer_reflection/modules/const/color/button.dart'
    show ConstantColorButton;
import 'package:gamer_reflection/modules/const/color/base.dart'
    show ConstantColor;
import 'package:gamer_reflection/components/common/atoms/text_tag.dart'
    show TextTag;
import 'package:gamer_reflection/components/common/atoms/spacer/width.dart'
    show SpacerWidth;
import 'package:gamer_reflection/modules/type/tag_text_color.dart'
    show TagTextColor;
import 'package:gamer_reflection/modules/const/size.dart' show ConstantSizeUI;

/// ボタン: タスク候補一覧
class ButtonTaskCandidate extends StatelessWidget {
  const ButtonTaskCandidate({
    super.key,
    required this.text,
    required this.isThin,
    required this.count,
    required this.onClickRemove,
  });

  /// 文字
  final String text;

  /// 薄いか
  final bool isThin;

  /// 回数
  final int count;

  /// 削除をクリックした
  final void Function() onClickRemove;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isThin
            ? ConstantColorButton.taskListThin
            : ConstantColorButton.taskList,
        border: Border.all(color: ConstantColor.boxBorder),
      ),
      padding: const EdgeInsets.symmetric(
        vertical: ConstantSizeUI.l2,
        horizontal: ConstantSizeUI.l3,
      ),
      child: Row(
        children: [
          TextTag(
            text: "+$count回",
            colorType: TagTextColor.blue,
          ),
          SpacerWidth.m,
          Expanded(
            child: BasicText(
              text: text,
              size: "S",
            ),
          ),
          SpacerWidth.s,
          CircleAvatar(
            radius: ConstantSizeUI.l3,
            backgroundColor: ConstantColor.iconBackGround,
            child: IconButton(
              iconSize: ConstantSizeUI.l3,
              padding: const EdgeInsets.all(0),
              icon: const Icon(
                Icons.close,
                color: ConstantColor.iconDark,
              ),
              onPressed: () => onClickRemove(),
              splashRadius: 0.1,
            ),
          ),
        ],
      ),
    );
  }
}
