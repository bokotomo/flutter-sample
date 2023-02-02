import 'package:flutter/material.dart' show runApp;
import 'package:gamer_reflection/components/root/app.dart' show App;
import 'package:gamer_reflection/injector.dart' show configureDependencies;

/// アプリ実行
void main() {
  /// injector
  configureDependencies();

  /// 起動
  runApp(const App());
}
