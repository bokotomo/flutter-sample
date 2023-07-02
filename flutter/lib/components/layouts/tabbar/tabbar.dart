import 'package:flutter/material.dart'
    show Widget, BuildContext, Scaffold, ValueNotifier;
import 'package:flutter_hooks/flutter_hooks.dart' show HookWidget;
import 'package:gamer_reflection/components/common/molecules/footer/widget.dart'
    show Footer;
import 'package:gamer_reflection/components/layouts/tabbar/hooks.dart'
    show Hooks;
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;

/// home
Scaffold view(
  AppLocalizations i18n,
  Widget tabPage,
  int selectedIndex,
  void Function(int) onClickTab,
) {
  return Scaffold(
    body: tabPage,
    bottomNavigationBar: Footer(
      i18n: i18n,
      onClickTab: onClickTab,
      selectedIndex: selectedIndex,
    ),
  );
}

/// Tabbar
class Tabbar extends HookWidget {
  const Tabbar({
    super.key,
    required this.canDC,
  });
  final ValueNotifier<bool> canDC;

  @override
  Widget build(BuildContext context) {
    final Hooks hooks = Hooks();
    final i18n = AppLocalizations.of(context)!;

    return view(
      i18n,
      hooks.tabPage(canDC),
      hooks.selectedIndex.value,
      hooks.onClickTab,
    );
  }
}
