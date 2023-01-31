import 'package:flutter/material.dart';
import 'package:gamer_reflection/modules/const/color.dart' show ConstantColor;

/// Footer
class Footer extends StatefulWidget {
  const Footer({
    super.key,
    required this.onItemTapped,
    required this.selectedIndex,
  });
  // タブを押した
  final void Function(int) onItemTapped;
  // 選択しているタブ
  final int selectedIndex;

  @override
  State<Footer> createState() => _FooterState();
}

/// タブの一覧
const items = <BottomNavigationBarItem>[
  BottomNavigationBarItem(
    icon: Icon(Icons.list),
    label: "Task",
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.check_box),
    label: "Reflection",
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.radar),
    label: "Ranking",
  ),
];

/// _FooterState
class _FooterState extends State<Footer> {
  void _onItemTapped(int index) {
    widget.onItemTapped(index);
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: widget.selectedIndex,
      backgroundColor: ConstantColor.footer,
      onTap: _onItemTapped,
      items: items,
      selectedItemColor: ConstantColor.text,
      unselectedItemColor: ConstantColor.textOpacity,
      type: BottomNavigationBarType.fixed,
    );
  }
}
