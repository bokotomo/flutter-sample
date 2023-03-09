import 'package:flutter/material.dart';
import 'package:gamer_reflection/components/common/atoms/input_select.dart'
    show InputSelect;
import 'package:gamer_reflection/components/common/atoms/text.dart'
    show BasicText;

/// 振り返りのグループ選択
class SelectReflectionGroup extends StatelessWidget {
  const SelectReflectionGroup({
    super.key,
    this.focusNode,
    this.onChanged,
  });

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

    const List<DropdownMenuItem<String>> items = [
      DropdownMenuItem(
        value: '1',
        child: BasicText(
          size: "M",
          text: "振り返り名A",
        ),
      ),
      DropdownMenuItem(
        value: '2',
        child: BasicText(
          size: "M",
          text: "振り返り名B",
        ),
      ),
    ];
    const value = "1";

    return InputSelect(
      items: items,
      value: value,
      onChanged: onChanged,
      focusNode: focusNode,
    );
  }
}
