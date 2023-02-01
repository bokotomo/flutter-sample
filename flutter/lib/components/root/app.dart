import 'package:flutter/material.dart';
import 'package:gamer_reflection/components/layouts/tabbar.dart' show Tabbar;
import 'package:gamer_reflection/modules/database/sqlite.dart'
    show initDatabase;
import 'package:sqflite/sqflite.dart';

///
const title = 'Gamer Reflection';

/// 初期
Future<Database> setUp() async {
  Database db = await initDatabase();
  print("initDatabase");
  return db;
}

/// 基本
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    /// 一旦
    final Future<Database> db = setUp();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Tabbar(db: db),
    );
  }
}
