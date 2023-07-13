import 'package:flutter/material.dart' show Widget, BuildContext, FocusNode;
import 'package:flutter_hooks/flutter_hooks.dart' show HookWidget;
import 'package:gamer_reflection/components/common/atoms/input/select.dart'
    show InputSelect;
import 'package:gamer_reflection/components/common/molecules/select_language/hooks.dart'
    show useHooks;
import 'package:gamer_reflection/modules/type/locale.dart' show LocaleCode;

/// 言語選択
class SelectLanguage extends HookWidget {
  const SelectLanguage({
    super.key,
    required this.changeLocale,
    this.focusNode,
  });

  /// 言語を変更する
  final void Function(LocaleCode) changeLocale;

  /// フォーカスノード
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    final h = useHooks(
      context,
      changeLocale,
    );

    return InputSelect(
      items: h.languages,
      value: h.language,
      onChanged: h.onChanged,
      focusNode: focusNode,
    );
  }
}
