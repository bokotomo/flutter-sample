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

///
Widget view(
  int currentIndex,
  void Function(int) onClickTab,
) {
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
