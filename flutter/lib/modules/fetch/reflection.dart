import 'package:gamer_reflection/modules/domain/reflection.dart'
    show DomainReflection;
import 'package:gamer_reflection/modules/type/reflection.dart'
    show ReflectionType;

/// モック
final List<DomainReflection> reflections = [
  DomainReflection(
    id: 1,
    text: "振り返り内容1",
    count: 3,
    reflectionType: ReflectionType.bad,
    createdAt: DateTime.now(),
  ),
  DomainReflection(
    id: 2,
    text: "振り返り内容その2",
    count: 2,
    reflectionType: ReflectionType.bad,
    createdAt: DateTime.now(),
  ),
  DomainReflection(
    id: 3,
    text: "振り返り内容その3",
    count: 1,
    reflectionType: ReflectionType.bad,
    createdAt: DateTime.now(),
  ),
];

/// 振り返り一覧取得
List<DomainReflection> fetchReflections() {
  print(reflections);
  return reflections;
}
