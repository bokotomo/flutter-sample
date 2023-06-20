import 'package:flutter/material.dart'
    show Widget, BuildContext, MaterialApp, ThemeData, VisualDensity;
import 'package:flutter_hooks/flutter_hooks.dart' show HookWidget;
import 'package:gamer_reflection/components/layouts/tabbar/tabbar.dart'
    show Tabbar;
import 'package:gamer_reflection/components/root/hooks.dart' show useHooks;

const title = 'Gamer Reflection';

/// ページ: ルート
class App extends HookWidget {
  const App({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final hooks = useHooks();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Tabbar(canDC: hooks.canDC),
    );
  }
}
