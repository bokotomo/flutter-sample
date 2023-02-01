import 'package:sqflite/sqflite.dart';
import 'package:gamer_reflection/modules/database/repository/reflection.dart'
    show insertReflection;

/// 新規追加: Reflection
Future<void> addReflection(Future<Database> db, String text) async {
  final Database d = await db;
  await insertReflection(d, text);
}
