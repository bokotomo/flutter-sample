import 'package:flutter/material.dart';
import 'package:gamer_reflection/components/common/molecules/footer.dart'
    show Footer;
import 'package:gamer_reflection/components/layouts/hooks.dart' show Hooks;

/// home
Scaffold view(
  Widget tabPage,
  int selectedIndex,
  void Function(int) onItemTapped,
) {
  return Scaffold(
    body: tabPage,
    bottomNavigationBar: Footer(
      onItemTapped: onItemTapped,
      selectedIndex: selectedIndex,
    ),
  );
}

/// Tabbar
class Tabbar extends StatefulWidget {
  const Tabbar({
    super.key,
    required this.canDC,
  });
  final ValueNotifier<bool> canDC;

  @override
  State<Tabbar> createState() => _TabbarState();
}

/// _ContentState
class _TabbarState extends State<Tabbar> {
  /// 現在選択しているタブIndex
  int _selectedIndex = 0;

  /// タブがクリックされた
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: view(
        Hooks().tabPage(widget.canDC, _selectedIndex),
        _selectedIndex,
        _onItemTapped,
      ),
    );
  }
}
