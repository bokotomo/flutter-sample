import 'package:gamer_reflection/modules/domain/reflection.dart'
    show DomainReflection;
import 'package:gamer_reflection/modules/type/reflection.dart'
    show ReflectionType;
import 'package:gamer_reflection/modules/database/repository/reflection.dart'
    show RepositoryReflection;

/// 振り返り一覧取得
Future<List<DomainReflection>> fetchReflections(
    RepositoryReflection? repositoryReflection) async {
  if (repositoryReflection == null) return [];

  final models = await repositoryReflection.getReflections();
  return models
      .map(
        (e) => DomainReflection(
          id: e.id ?? 0,
          text: e.text,
          count: e.count,
          reflectionType: ReflectionType.bad,
          createdAt: DateTime.now(),
        ),
      )
      .toList();
}
