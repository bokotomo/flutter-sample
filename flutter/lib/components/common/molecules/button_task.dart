import 'package:flutter/material.dart';
import 'package:gamer_reflection/components/common/atoms/text.dart'
    show BasicText;
import 'package:gamer_reflection/modules/const/color.dart'
    show ConstantColorButton;
import 'package:gamer_reflection/modules/const/size.dart' show ConstantSizeUI;
import 'package:gamer_reflection/components/common/atoms/text_tag.dart'
    show TextTag;
import 'package:gamer_reflection/modules/type/tag_text_color.dart'
    show TagTextColor;

/// ボタン: タスク一覧ページ
class ButtonTask extends StatelessWidget {
  const ButtonTask({
    super.key,
    required this.text,
    required this.isThin,
    required this.count,
    required this.tagTextColor,
    this.onPressed,
  });

  /// 文字
  final String text;

  /// 薄いか
  final bool isThin;

  /// 回数
  final int count;

  /// 色
  final TagTextColor tagTextColor;

  /// クリックした
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    void onPressed() {
      if (this.onPressed == null) return;
      this.onPressed!();
    }

    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: isThin
              ? ConstantColorButton.buttonTaskListThin
              : ConstantColorButton.buttonTaskList,
          minimumSize: const Size.fromHeight(ConstantSizeUI.l10),
        ),
        child: Row(
          children: [
            TextTag(
              text: "$count回",
              colorType: tagTextColor,
            ),
            const SizedBox(
              width: ConstantSizeUI.l3,
            ),
            BasicText(
              text: text,
              size: "M",
            ),
          ],
        ));
  }
}
