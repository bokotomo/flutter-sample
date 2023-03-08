import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart' show useState;
import 'package:gamer_reflection/components/pages/account/account.dart'
    show PageAccountSetting;
import 'package:gamer_reflection/components/pages/task/task.dart' show PageTask;
import 'package:gamer_reflection/components/pages/ranking/ranking.dart'
    show PageRanking;
import 'package:gamer_reflection/components/pages/reflection/reflection.dart'
    show PageReflection;

/// Hooks: TabBar
class Hooks {
  final ValueNotifier<int> selectedIndex = useState<int>(0);

  /// タブがクリックされた
  void onClickTab(int index) {
    selectedIndex.value = index;
  }

  /// タブを押すと表示するページ
  Widget tabPage(
    ValueNotifier<bool> canDC,
  ) {
    final List<Widget> pages = [
      PageTask(canDC: canDC),
      const PageReflection(),
      const PageRanking(),
      const PageAccountSetting(),
    ];
    return pages[selectedIndex.value];
  }
}
