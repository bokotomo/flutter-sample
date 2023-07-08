import 'package:flutter/material.dart' show Widget, BuildContext, FocusNode;
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;
import 'package:flutter_hooks/flutter_hooks.dart' show HookWidget;
import 'package:gamer_reflection/components/common/atoms/input/select.dart'
    show InputSelect;
import 'package:gamer_reflection/components/common/molecules/select_color_mode/hooks.dart'
    show useHooks;

/// カラーモード選択
class SelectColorMode extends HookWidget {
  const SelectColorMode({
    super.key,
    required this.i18n,
    this.focusNode,
  });

  /// 言語
  final AppLocalizations i18n;

  /// フォーカスノード
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    final hooks = useHooks(i18n);

    return InputSelect(
      items: hooks.colors,
      value: hooks.colorMode,
      onChanged: hooks.onChanged,
      focusNode: focusNode,
    );
  }
}
