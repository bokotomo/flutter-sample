import 'package:flutter/material.dart';
import 'package:gamer_reflection/components/templates/reflection/reflection.dart'
    as reflection;

/// ページ: 振り返りの一覧こちらは不要だった
class PageReflection extends StatefulWidget {
  const PageReflection({super.key});

  @override
  State<PageReflection> createState() => _PageReflectionState();
}

/// _PageReflectionState
class _PageReflectionState extends State<PageReflection> {
  @override
  void initState() {
    print("PageReflection");

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: reflection.TemplateReflection(),
    );
  }
}
