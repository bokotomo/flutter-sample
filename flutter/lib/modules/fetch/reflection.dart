import 'package:get_it/get_it.dart';
import 'package:gamer_reflection/modules/domain/reflection.dart'
    show DomainReflection;
import 'package:gamer_reflection/modules/type/reflection.dart'
    show ReflectionType;
import 'package:gamer_reflection/modules/database/repository/reflection.dart'
    show IRepositoryReflection;
import 'package:gamer_reflection/modules/database/driver/sqlite.dart'
    show DBConnection;

/// Fetch: Reflection
class FetchReflection {
  final IRepositoryReflection repositoryReflection =
      GetIt.I<IRepositoryReflection>();

  /// 振り返り一覧取得
  Future<List<DomainReflection>> fetchReflections() async {
    final db = GetIt.I<DBConnection>().db;
    final models = await repositoryReflection.getReflections(db);
    final domain = models.map(
      (e) => DomainReflection(
        id: e.id ?? 0,
        text: e.text,
        count: e.count,
        reflectionType: ReflectionType.bad,
        createdAt: DateTime.now(),
      ),
    );
    return domain.toList();
  }
}
