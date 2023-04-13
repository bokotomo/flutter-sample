import 'package:flutter/material.dart' show Widget, BuildContext, FocusNode;
import 'package:flutter_hooks/flutter_hooks.dart' show HookWidget;
import 'package:gamer_reflection/components/common/atoms/input_select.dart'
    show InputSelect;
import 'package:gamer_reflection/components/common/molecules/select_color_mode/hooks.dart'
    show useHooks;

/// カラーモード選択
class SelectColorMode extends HookWidget {
  const SelectColorMode({
    super.key,
    this.focusNode,
  });

  /// フォーカスノード
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    final hooks = useHooks();

    return InputSelect(
      items: hooks.colors,
      value: hooks.colorMode,
      onChanged: hooks.onChanged,
      focusNode: focusNode,
    );
  }
}
