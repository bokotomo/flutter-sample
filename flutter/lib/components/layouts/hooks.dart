import 'package:flutter/material.dart';
import 'package:gamer_reflection/components/pages/account/account.dart'
    show PageAccountSetting;
import 'package:gamer_reflection/components/pages/task/task.dart' show PageTask;
import 'package:gamer_reflection/components/pages/ranking/ranking.dart'
    show PageRanking;
import 'package:gamer_reflection/components/pages/reflection/reflection.dart'
    show PageReflection;

class Hooks {
  /// タブを押すと表示するページ
  Widget tabPage(
    ValueNotifier<bool> canDC,
    int selectedIndex,
  ) {
    final pages = [
      PageTask(canDC: canDC),
      const PageReflection(),
      const PageRanking(),
      const PageAccountSetting(),
    ];
    return pages[selectedIndex];
  }
}
