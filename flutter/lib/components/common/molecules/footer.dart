import 'package:flutter/material.dart';
import 'package:gamer_reflection/modules/const/color.dart' show ConstantColor;
// import 'package:gamer_reflection/modules/const/size.dart' show ConstantSizeUI;

/// Footer
class Footer extends StatefulWidget {
  const Footer({
    super.key,
    required this.onClickTab,
    required this.selectedIndex,
  });
  // タブを押した
  final void Function(int) onClickTab;
  // 選択しているタブ
  final int selectedIndex;

  @override
  State<Footer> createState() => _FooterState();
}

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

/// _FooterState
class _FooterState extends State<Footer> {
  /// タブがクリックされた
  void _onClickTab(int index) {
    widget.onClickTab(index);
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: widget.selectedIndex,
      backgroundColor: ConstantColor.footer,
      onTap: _onClickTab,
      items: items,
      selectedItemColor: ConstantColor.text,
      unselectedItemColor: ConstantColor.textOpacity,
      type: BottomNavigationBarType.fixed,
    );
  }
}
