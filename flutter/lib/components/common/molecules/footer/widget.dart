import 'package:flutter/material.dart' show Widget, BuildContext;
import 'package:gamer_reflection/components/common/molecules/footer/view.dart'
    show view;
import 'package:flutter_hooks/flutter_hooks.dart' show HookWidget;

/// Footer
class Footer extends HookWidget {
  const Footer({
    super.key,
    required this.selectedIndex,
    required this.onClickTab,
  });

  /// 選択しているタブ
  final int selectedIndex;

  /// タブがクリックされた
  final void Function(int) onClickTab;

  @override
  Widget build(BuildContext context) {
    return view(
      selectedIndex,
      onClickTab,
    );
  }
}
