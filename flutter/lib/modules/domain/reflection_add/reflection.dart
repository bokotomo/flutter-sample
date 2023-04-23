import 'package:gamer_reflection/modules/domain/site/reflection.dart'
    show DomainReflectionText, DomainReflectionCount;

/// ドメイン: 振り返り
class DomainReflection implements DomainReflectionText, DomainReflectionCount {
  const DomainReflection({
    required this.text,
    required this.count,
  });

  /// 振り返り内容
  @override
  final String text;

  /// 回数
  @override
  final int count;
}
