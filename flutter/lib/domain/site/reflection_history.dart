import 'package:gamer_reflection/modules/type/reflection.dart'
    show ReflectionType;

/// ドメイン: 振り返りID
class DomainReflectionHistoryId {
  const DomainReflectionHistoryId({required this.id});
  final int id;
}

/// ドメイン: 振り返り内容
class DomainReflectionHistoryText {
  const DomainReflectionHistoryText({required this.text});
  final String text;
}

/// ドメイン: 振り返り回数
class DomainReflectionHistoryCount {
  const DomainReflectionHistoryCount({required this.count});
  final int count;
}

/// ドメイン: 振り返りの種類
class DomainReflectionHistoryType {
  const DomainReflectionHistoryType({required this.reflectionType});
  final ReflectionType reflectionType;
}

/// ドメイン: 振り返り日付
class DomainReflectionHistoryDate {
  const DomainReflectionHistoryDate({required this.date});
  final DateTime date;
}
