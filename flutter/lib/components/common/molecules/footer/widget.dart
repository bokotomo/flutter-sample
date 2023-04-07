import 'package:flutter/material.dart'
    show StatelessWidget, Widget, BuildContext;
import 'package:gamer_reflection/components/common/molecules/footer/view.dart'
    show view;

/// Footer
class Footer extends StatelessWidget {
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
