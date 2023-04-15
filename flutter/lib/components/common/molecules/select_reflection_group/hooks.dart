import 'package:flutter/material.dart' show AsyncSnapshot, ValueNotifier;
import 'package:flutter_hooks/flutter_hooks.dart'
    show useEffect, useState, useMemoized, useFuture;
import 'package:gamer_reflection/components/common/atoms/input_select.dart'
    show SelectItem;
import 'package:gamer_reflection/modules/domain/reflection_group.dart'
    show DomainReflectionGroup;
import 'package:gamer_reflection/modules/storage/selected_reflection_group.dart'
    show selectReflectionGroup;

class UseReturn {
  const UseReturn({
    required this.reflectionNames,
    required this.reflectionId,
    required this.onChanged,
  });
  final List<SelectItem> reflectionNames;
  final String reflectionId;
  final void Function(String?) onChanged;
}

///
UseReturn useHooks(List<DomainReflectionGroup> reflectionGroups) {
  /// 選択している期間
  final Future<String?> memoedReflectionGroup =
      useMemoized(() => selectReflectionGroup.get());
  final AsyncSnapshot<String?> futuredReflectionGroup =
      useFuture(memoedReflectionGroup);

  /// 選択グループID
  ValueNotifier<String> reflectionId = useState<String>(
    reflectionGroups.isEmpty ? "0" : reflectionGroups[0].id.toString(),
  );

  /// 変更を押した
  void onChanged(String? t) {
    selectReflectionGroup.save(t ?? '');
  }

  /// 振り返りグループ名一覧
  final List<SelectItem> reflectionNames = reflectionGroups
      .map(
        (r) => SelectItem(
          text: r.name,
          value: r.id.toString(),
        ),
      )
      .toList();

  useEffect(() {
    if (futuredReflectionGroup.data == null) return;

    /// 初期選択グループ
    reflectionId.value = futuredReflectionGroup.data ??
        (reflectionGroups.isEmpty ? "0" : reflectionGroups[0].id.toString());
  }, [futuredReflectionGroup.data]);

  return UseReturn(
    reflectionNames: reflectionNames,
    reflectionId: reflectionId.value,
    onChanged: onChanged,
  );
}
