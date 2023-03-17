import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart' show HookWidget;
import 'package:gamer_reflection/components/common/molecules/footer/widget.dart'
    show Footer;
import 'package:gamer_reflection/components/layouts/tabbar/hooks.dart'
    show Hooks;

/// home
Scaffold view(
  Widget tabPage,
  int selectedIndex,
  void Function(int) onClickTab,
) {
  return Scaffold(
    body: tabPage,
    bottomNavigationBar: Footer(
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

    return MaterialApp(
      home: view(
        hooks.tabPage(canDC),
        hooks.selectedIndex.value,
        hooks.onClickTab,
      ),
    );
  }
}
