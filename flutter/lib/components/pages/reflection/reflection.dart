import 'package:flutter/material.dart';
import 'package:gamer_reflection/components/templates/reflection_add/reflection_add.dart'
    as reflection_add;

/// ページ: 振り返りの追加
class PageReflection extends StatefulWidget {
  const PageReflection({super.key});

  @override
  State<PageReflection> createState() => _PageReflectionState();
}

/// _PageReflectionAddState
class _PageReflectionState extends State<PageReflection> {
  Future<void> getData() async {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    print("PageReflection");

    getData();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: reflection_add.TemplateReflectionAdd(),
    );
  }
}
