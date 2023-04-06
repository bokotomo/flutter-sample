import 'package:flutter/material.dart' show AsyncSnapshot, ValueNotifier;
import 'package:flutter_hooks/flutter_hooks.dart'
    show useEffect, useState, useMemoized, useFuture;
import 'package:gamer_reflection/components/common/atoms/input_select.dart'
    show SelectItem;
import 'package:gamer_reflection/modules/strage/selected_reflection_group.dart'
    show selectReflectionGroup;

class UseReturn {
  const UseReturn({
    required this.reflectionNames,
    required this.reflectionName,
    required this.onChanged,
  });
  final List<SelectItem> reflectionNames;
  final String reflectionName;
  final void Function(String?) onChanged;
}

///
UseReturn useHooks() {
  /// 選択している期間
  final Future<String?> memoedReflectionGroup =
      useMemoized(() => selectReflectionGroup.get());
  final AsyncSnapshot<String?> futuredReflectionGroup =
      useFuture(memoedReflectionGroup);

  /// 選択グループID
  ValueNotifier<String> reflectionName = useState<String>("1");

  /// 変更を押した
  void onChanged(String? t) {
    selectReflectionGroup.save(t ?? '');
  }

  /// 振り返りグループ名一覧
  const List<SelectItem> reflectionNames = [
    SelectItem(text: '振り返り名A', value: '1'),
    SelectItem(text: '振り返り名B', value: '2'),
    SelectItem(text: '振り返り名C', value: '3'),
  ];

  useEffect(() {
    if (futuredReflectionGroup.data == null) return;

    /// 初期選択グループ
    reflectionName.value = futuredReflectionGroup.data ?? "1";
  }, [futuredReflectionGroup.data]);

  return UseReturn(
    reflectionNames: reflectionNames,
    reflectionName: reflectionName.value,
    onChanged: onChanged,
  );
}
