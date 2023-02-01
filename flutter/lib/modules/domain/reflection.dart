import 'package:gamer_reflection/modules/type/reflection.dart'
    show ReflectionType;

/// ドメイン: 振り返り
class DomainReflection {
  const DomainReflection({
    required this.id,
    required this.text,
    required this.count,
    required this.reflectionType,
    required this.createdAt,
  });

  /// ID
  final int id;

  /// 振り返り内容
  final String text;

  /// 回数
  final int count;

  /// 振り返りの種類
  final ReflectionType reflectionType;

  /// 日付
  final DateTime createdAt;
}
