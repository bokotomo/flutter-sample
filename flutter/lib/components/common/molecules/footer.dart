import 'package:flutter/material.dart';
import 'package:gamer_reflection/modules/const/color.dart' show ConstantColor;

Widget view(
    BuildContext context, int currentIndex, void Function(int) onClickTab) {
  /// タブの一覧
  const items = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Icon(Icons.list),
      label: "タスク",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.add),
      label: "振り返り",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.games),
      label: "ランキング",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.account_circle),
      label: "アカウント",
    ),
  ];

  return BottomNavigationBar(
    currentIndex: currentIndex,
    backgroundColor: ConstantColor.footer,
    onTap: onClickTab,
    items: items,
    selectedItemColor: ConstantColor.text,
    unselectedItemColor: ConstantColor.textOpacity,
    type: BottomNavigationBarType.fixed,
  );
}

/// Footer
class Footer extends StatefulWidget {
  const Footer({
    super.key,
    required this.onClickTab,
    required this.selectedIndex,
  });

  /// タブを押した
  final void Function(int) onClickTab;

  /// 選択しているタブ
  final int selectedIndex;

  @override
  State<Footer> createState() => _FooterState();
}

/// _FooterState
class _FooterState extends State<Footer> {
  /// タブがクリックされた
  void _onClickTab(int index) {
    widget.onClickTab(index);
  }

  @override
  Widget build(BuildContext context) {
    return view(
      context,
      widget.selectedIndex,
      _onClickTab,
    );
  }
}
