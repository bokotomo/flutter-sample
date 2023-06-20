import 'package:flutter/material.dart' show Widget, BuildContext, FocusNode;
import 'package:flutter_hooks/flutter_hooks.dart' show HookWidget;
import 'package:gamer_reflection/components/common/atoms/input/select.dart'
    show InputSelect;
import 'package:gamer_reflection/domain/common/reflection_group.dart'
    show DomainReflectionGroup;
import 'package:gamer_reflection/components/common/molecules/select_reflection_group/hooks.dart'
    show useHooks;

/// 振り返りのグループ選択
class SelectReflectionGroup extends HookWidget {
  const SelectReflectionGroup({
    super.key,
    required this.reflectionGroups,
    required this.onChanged,
    this.focusNode,
  });

  /// フォーカスノード
  final FocusNode? focusNode;

  ///
  final List<DomainReflectionGroup> reflectionGroups;

  ///
  final void Function(String?) onChanged;

  @override
  Widget build(BuildContext context) {
    final hooks = useHooks(reflectionGroups, onChanged);

    return InputSelect(
      items: hooks.reflectionNames,
      value: hooks.reflectionId,
      onChanged: hooks.onChanged,
      focusNode: focusNode,
    );
  }
}
