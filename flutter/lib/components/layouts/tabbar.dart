import 'package:flutter/material.dart';
import 'package:gamer_reflection/components/common/molecules/footer.dart'
    show Footer;
import 'package:gamer_reflection/components/pages/account/account.dart'
    show PageAccountSetting;
import 'package:gamer_reflection/components/pages/task/task.dart' show PageTask;
import 'package:gamer_reflection/components/pages/ranking/ranking.dart'
    show PageRanking;
import 'package:gamer_reflection/components/pages/reflection/reflection.dart'
    show PageReflection;

/// home
Widget home(
  List<Widget> tabPages,
  int selectedIndex,
  void Function(int) onItemTapped,
) {
  return Scaffold(
    body: tabPages[selectedIndex],
    bottomNavigationBar: Footer(
      onItemTapped: onItemTapped,
      selectedIndex: selectedIndex,
    ),
  );
}

/// Tabbar
class Tabbar extends StatefulWidget {
  const Tabbar({super.key, required this.canDC});
  final ValueNotifier<bool> canDC;

  @override
  State<Tabbar> createState() => _TabbarState();
}

/// _ContentState
class _TabbarState extends State<Tabbar> {
  /// タブで表示するページ一覧
  List<Widget> _tabPages(ValueNotifier<bool> canDC) {
    return [
      PageTask(canDC: canDC),
      const PageReflection(),
      const PageRanking(),
      const PageAccountSetting(),
    ];
  }

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
      home: home(
        _tabPages(widget.canDC),
        _selectedIndex,
        _onItemTapped,
      ),
    );
  }
}
