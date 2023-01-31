import 'package:flutter/material.dart';
import 'package:gamer_reflection/components/common/molecules/footer.dart'
    as footer;
import 'package:gamer_reflection/components/pages/task/task.dart' as task;
import 'package:gamer_reflection/components/pages/ranking/ranking.dart'
    as ranking;
import 'package:gamer_reflection/components/pages/reflection/reflection_add.dart'
    as reflection_add;

/// home
Widget home(
  List<Widget> tabPages,
  int selectedIndex,
  void Function(int) onItemTapped,
) {
  return Scaffold(
    body: tabPages[selectedIndex],
    bottomNavigationBar: footer.Footer(
      onItemTapped: onItemTapped,
      selectedIndex: selectedIndex,
    ),
  );
}

/// Tabbar
class Tabbar extends StatefulWidget {
  const Tabbar({super.key});

  @override
  State<Tabbar> createState() => _TabbarState();
}

/// _ContentState
class _TabbarState extends State<Tabbar> {
  /// タブで表示するページ一覧
  static const List<Widget> _tabPages = [
    task.PageTask(),
    reflection_add.PageReflectionAdd(),
    ranking.PageRanking(),
  ];

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
        _tabPages,
        _selectedIndex,
        _onItemTapped,
      ),
    );
  }
}
