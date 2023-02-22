import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter_hooks/flutter_hooks.dart' show HookWidget;
import 'package:flutter_hooks/flutter_hooks.dart' show useState, useEffect;
import 'package:gamer_reflection/modules/database/driver/sqlite.dart'
    show initDatabase, DBConnection;
import 'package:gamer_reflection/components/layouts/tabbar/tabbar.dart'
    show Tabbar;

const title = 'Gamer Reflection';

/// ページ: タスク一覧
class App extends HookWidget {
  const App({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> canDC = useState<bool>(false);

    /// 初期
    Future<void> setUp() async {
      Database db = await initDatabase();
      GetIt.I.registerSingleton<DBConnection>(DBConnection(db: db));
    }

    ///
    Future<void> setData() async {
      await setUp();
      canDC.value = true;
    }

    useEffect(() {
      setData();
    }, []);

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
