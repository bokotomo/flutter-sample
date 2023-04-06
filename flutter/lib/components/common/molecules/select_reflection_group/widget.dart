import 'package:flutter/material.dart' show Widget, BuildContext, FocusNode;
import 'package:flutter_hooks/flutter_hooks.dart' show HookWidget;
import 'package:gamer_reflection/components/common/atoms/input_select.dart'
    show InputSelect;
import 'package:gamer_reflection/components/common/molecules/select_reflection_group/hooks.dart'
    show useHooks;

/// 振り返りのグループ選択
class SelectReflectionGroup extends HookWidget {
  const SelectReflectionGroup({
    super.key,
    this.focusNode,
  });

  /// フォーカスノード
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    final hooks = useHooks();

    return InputSelect(
      items: hooks.reflectionNames,
      value: hooks.reflectionName,
      onChanged: hooks.onChanged,
      focusNode: focusNode,
    );
  }
}
