import 'package:flutter/material.dart' show Widget, BuildContext, FocusNode;
import 'package:flutter_hooks/flutter_hooks.dart' show HookWidget;
import 'package:gamer_reflection/components/common/atoms/input_select.dart'
    show InputSelect;
import 'package:gamer_reflection/components/common/molecules/select_language/hooks.dart'
    show useHooks;

/// 言語選択
class SelectLanguage extends HookWidget {
  const SelectLanguage({
    super.key,
    this.focusNode,
  });

  /// フォーカスノード
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    final hooks = useHooks();

    return InputSelect(
      items: hooks.languages,
      value: hooks.language,
      onChanged: hooks.onChanged,
      focusNode: focusNode,
    );
  }
}
