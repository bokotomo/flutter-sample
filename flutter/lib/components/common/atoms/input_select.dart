import 'package:flutter/material.dart';
// import 'package:gamer_reflection/modules/const/color.dart'
//     show ConstantColor, ConstantColorInput;
// import 'package:gamer_reflection/modules/const/size.dart' show ConstantSizeUI;

/// input: select
class InputSelect extends StatelessWidget {
  const InputSelect({
    super.key,
    // required this.text,
    this.focusNode,
    this.onChanged,
  });

  /// プレフィックス
  // final TextEditingController text;

  /// フォーカスノード
  final FocusNode? focusNode;

  /// 変更した
  final void Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    /// 変更された
    void onChanged(String? t) {
      if (this.onChanged == null) return;
      this.onChanged!(t);
    }

    return DropdownButton(
      items: const [
        DropdownMenuItem(
          value: 'ja',
          child: Text('日本語'),
        ),
        DropdownMenuItem(
          value: 'en',
          child: Text('英語'),
        ),
      ],
      onChanged: onChanged,
    );
  }
}
