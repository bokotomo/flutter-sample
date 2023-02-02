import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:sqflite/sqflite.dart';
import 'package:gamer_reflection/modules/database/driver/sqlite.dart'
    show initDatabase, DBConnection;
import 'package:gamer_reflection/components/layouts/tabbar.dart' show Tabbar;

const title = 'Gamer Reflection';

/// ページ: タスク一覧
class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

/// _PageTaskState
class _AppState extends State<App> {
  final ValueNotifier<bool> canDC = ValueNotifier<bool>(false);

  /// 初期
  Future<void> setUp() async {
    Database db = await initDatabase();
    GetIt.I.registerSingleton<DBConnection>(DBConnection(db: db));
  }

  ///
  Future<void> setData() async {
    await setUp();
    setState(() {
      canDC.value = true;
    });
  }

  @override
  void initState() {
    super.initState();
    setData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Tabbar(canDC: canDC),
    );
  }
}
