import 'package:flutter/material.dart'
    show
        Widget,
        BottomNavigationBarItem,
        Icon,
        Icons,
        BottomNavigationBar,
        BottomNavigationBarType;
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;
import 'package:gamer_reflection/modules/const/color/base.dart'
    show ConstantColor;
import 'package:gamer_reflection/modules/const/color/base.dart'
    show useColorBase;

///
Widget view(
  AppLocalizations i18n,
  int currentIndex,
  void Function(int) onClickTab,
) {
  final u = useColorBase();

  /// タブの一覧
  final items = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: const Icon(Icons.mode_edit),
      label: i18n.footerSolution,
    ),
    BottomNavigationBarItem(
      icon: const Icon(Icons.add),
      label: i18n.footerReflection,
    ),
    BottomNavigationBarItem(
      icon: const Icon(Icons.list),
      label: i18n.footerTodo,
    ),
    BottomNavigationBarItem(
      icon: const Icon(Icons.account_circle),
      label: i18n.footerAccount,
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
