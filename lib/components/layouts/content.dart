import 'package:flutter/material.dart';
import 'package:gamer_reflection/components/common/molecules/footer.dart'
    as footer;
import 'package:gamer_reflection/components/pages/task.dart';
import 'package:gamer_reflection/components/pages/ranking.dart';
import 'package:gamer_reflection/components/pages/reflection.dart';

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

/// Content
class Content extends StatefulWidget {
  const Content({super.key});

  @override
  State<Content> createState() => _ContentState();
}

/// _ContentState
class _ContentState extends State<Content> {
  /// タブで表示するページ一覧
  static const List<Widget> _tabPages = [
    PageTask(),
    PageReflection(),
    PageRanking(),
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
