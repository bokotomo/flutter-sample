import 'package:flutter/material.dart'
    show StatelessWidget, Widget, BuildContext, Row, Expanded;
import 'package:gamer_reflection/components/common/atoms/spacer/width.dart'
    show SpacerWidth;
import 'package:gamer_reflection/components/common/atoms/button/radio.dart'
    show ButtonRadio;

/// ラジオボタン: 良かったこと悪かったこと
class RadioGoodBadButton extends StatelessWidget {
  const RadioGoodBadButton({
    super.key,
    required this.groupValue,
    required this.onChangedGood,
    required this.onChangedBad,
  });

  /// 文字
  final String groupValue;

  /// 良いに変更した
  final void Function(String?) onChangedGood;

  /// 悪いに変更した
  final void Function(String?) onChangedBad;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ButtonRadio(
            groupValue: groupValue,
            value: "good",
            text: "良かった",
            onPressed: (v) => onChangedGood(v),
          ),
        ),
        SpacerWidth.s,
        Expanded(
          child: ButtonRadio(
            groupValue: groupValue,
            value: "bad",
            text: "悪かった",
            onPressed: (v) => onChangedBad(v),
          ),
        ),
      ],
    );
  }
}
