import 'package:flutter/material.dart'
    show
        Widget,
        BottomNavigationBarItem,
        Icon,
        Icons,
        BottomNavigationBar,
        BottomNavigationBarType;
import 'package:gamer_reflection/modules/const/color/base.dart'
    show ConstantColor;
import 'package:gamer_reflection/modules/const/color/base.dart'
    show useColorBase;

///
Widget view(
  int currentIndex,
  void Function(int) onClickTab,
) {
  final u = useColorBase();

  /// タブの一覧
  const items = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Icon(Icons.mode_edit),
      label: "解決案",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.add),
      label: "振り返る",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.list),
      label: "やること",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.account_circle),
      label: "アカウント",
    ),
  ];

  return BottomNavigationBar(
    currentIndex: currentIndex,
    backgroundColor: u.footer,
    onTap: onClickTab,
    items: items,
    selectedItemColor: ConstantColor.text,
    unselectedItemColor: ConstantColor.textOpacity,
    type: BottomNavigationBarType.fixed,
  );
}
