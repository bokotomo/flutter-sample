import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart' show HookWidget;
import 'package:flutter_hooks/flutter_hooks.dart' show useState, useEffect;
import 'package:gamer_reflection/components/templates/reflection_add/reflection_add.dart'
    show TemplateReflectionAdd;
import 'package:gamer_reflection/modules/domain/reflection.dart'
    show DomainReflection;
import 'package:gamer_reflection/modules/fetch/reflection.dart'
    show FetchReflection;

/// ページ: 振り返りの追加
class PageReflection extends HookWidget {
  const PageReflection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ValueNotifier<List<DomainReflection>> reflections =
        useState<List<DomainReflection>>([]);

    /// データの取得
    Future<void> getData() async {
      final List<DomainReflection> r =
          await FetchReflection().fetchReflections();

      /// 大きい順にソート
      r.sort(((a, b) => b.count.compareTo(a.count)));

      reflections.value = r;
    }

    useEffect(() {
      getData();
    }, []);

    return Scaffold(
      body: TemplateReflectionAdd(
        reflections: reflections.value,
      ),
    );
  }
}
