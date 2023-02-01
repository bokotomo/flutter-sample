import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:gamer_reflection/modules/database/sqlite.dart'
    show initDatabase;
import 'package:gamer_reflection/components/layouts/tabbar.dart' show Tabbar;
import 'package:gamer_reflection/modules/database/repository/reflection.dart'
    show RepositoryReflection;
import 'package:gamer_reflection/modules/database/repositories.dart'
    show Repositories;

const title = 'Gamer Reflection';

/// ページ: タスク一覧
class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

/// _PageTaskState
class _AppState extends State<App> {
  final ValueNotifier<Repositories?> repositories =
      ValueNotifier<Repositories?>(null);

  /// 初期
  Future<Database> setUp() async {
    Database db = await initDatabase();
    return db;
  }

  Future<void> setData() async {
    final Database db = await setUp();
    final repo = RepositoryReflection(db: db);

    setState(() {
      repositories.value = Repositories(repositoryReflection: repo);
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
      home: Tabbar(repositories: repositories),
    );
  }
}
