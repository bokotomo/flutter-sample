import 'package:flutter/material.dart';
import 'package:gamer_reflection/components/common/atoms/text.dart'
    show BasicText;
import 'package:gamer_reflection/components/common/atoms/spacer_width.dart'
    show SpacerWidth;

/// ラジオボタン: 良かったこと悪かったこと
class RadioGoodBadButton extends StatelessWidget {
  const RadioGoodBadButton({
    super.key,
    required this.groupValue,
    required this.onChangedGood,
    required this.onChangedBad,
  });

  /// 文字数
  final String groupValue;

  /// 変更した
  final void Function(String?) onChangedGood;

  /// 変更した
  final void Function(String?) onChangedBad;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Radio(
          activeColor: const Color.fromARGB(170, 104, 244, 48),
          value: "good",
          groupValue: groupValue,
          onChanged: (v) => onChangedGood(v),
        ),
        SpacerWidth.xs,
        const BasicText(
          text: "良かった",
          size: "M",
        ),
        SpacerWidth.s,
        Radio(
          activeColor: const Color.fromARGB(170, 244, 48, 175),
          value: "bad",
          groupValue: groupValue,
          onChanged: (v) => onChangedBad(v),
        ),
        SpacerWidth.xs,
        const BasicText(
          text: "悪かった",
          size: "M",
        ),
      ],
    );
  }
}
