import 'package:gamer_reflection/modules/database/repository/reflection.dart'
    show RepositoryReflection;

/// 新規追加: Reflection
Future<void> addReflection(RepositoryReflection? r, String text) async {
  if (r == null) return;
  await r.insertReflection(text);
}
