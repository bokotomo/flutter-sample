import 'package:flutter/material.dart';
import 'package:gamer_reflection/components/layouts/tabbar.dart' as tabbar;

///
const title = 'Gamer Reflection';

/// 基本
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const tabbar.Tabbar(),
    );
  }
}
