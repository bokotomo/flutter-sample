import 'package:flutter/material.dart';
import 'package:gamer_reflection/components/templates/reflection_add/reflection_add.dart'
    show TemplateReflectionAdd;
import 'package:gamer_reflection/modules/domain/reflection.dart'
    show DomainReflection;
import 'package:gamer_reflection/modules/fetch/reflection.dart'
    show FetchReflection;

/// ページ: 振り返りの追加
class PageReflection extends StatefulWidget {
  const PageReflection({super.key});

  @override
  State<PageReflection> createState() => _PageReflectionState();
}

/// _PageReflectionAddState
class _PageReflectionState extends State<PageReflection> {
  List<DomainReflection> reflections = [];

  Future<void> getData() async {
    final r = await FetchReflection().fetchReflections();

    setState(() {
      reflections = r;
    });
  }

  @override
  void initState() {
    super.initState();
    print("PageReflection");

    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TemplateReflectionAdd(
        reflections: reflections,
      ),
    );
  }
}
