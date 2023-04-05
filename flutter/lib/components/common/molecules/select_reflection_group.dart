import 'package:flutter/material.dart'
    show Widget, BuildContext, FocusNode, ValueNotifier;
import 'package:flutter_hooks/flutter_hooks.dart' show HookWidget, useState;
import 'package:gamer_reflection/components/common/atoms/input_select.dart'
    show InputSelect, SelectItem;

/// 振り返りのグループ選択
class SelectReflectionGroup extends HookWidget {
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
    /// 選択グループID
    ValueNotifier<String> reflectionName = useState<String>("1");

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

    return InputSelect(
      items: reflectionNames,
      value: reflectionName.value,
      onChanged: onChanged,
      focusNode: focusNode,
    );
  }
}
