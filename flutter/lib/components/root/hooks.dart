import 'package:flutter/material.dart' show ValueNotifier;
import 'package:get_it/get_it.dart' show GetIt;
import 'package:sqflite/sqflite.dart' show Database;
import 'package:flutter_hooks/flutter_hooks.dart' show useState, useEffect;
import 'package:gamer_reflection/modules/database/driver/sqlite.dart'
    show initDatabase, DBConnection;

class UseReturn {
  const UseReturn({
    required this.canDC,
  });

  final ValueNotifier<bool> canDC;
}

UseReturn useHooks() {
  final ValueNotifier<bool> canDC = useState<bool>(false);

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

  return UseReturn(canDC: canDC);
}
