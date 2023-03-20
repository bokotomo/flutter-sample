import 'package:flutter/material.dart';
import 'package:gamer_reflection/components/common/atoms/input_select.dart'
    show InputSelect, SelectItem;

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
    /// 変更を押した
    void onChanged(String? t) {
      if (this.onChanged == null) return;
      this.onChanged!(t);
    }

    /// 振り返りグループ名一覧
    const List<SelectItem> reflectionNames = [
      SelectItem(text: '振り返り名A', value: '1'),
      SelectItem(text: '振り返り名B', value: '2'),
    ];

    /// 初期選択ID
    const value = "1";

    return InputSelect(
      items: reflectionNames,
      value: value,
      onChanged: onChanged,
      focusNode: focusNode,
    );
  }
}
