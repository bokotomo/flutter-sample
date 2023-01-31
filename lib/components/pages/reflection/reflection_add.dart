import 'package:flutter/material.dart';
import 'package:gamer_reflection/components/templates/reflection_add/reflection_add.dart'
    as reflection_add;

/// ページ: 振り返りの追加
class PageReflectionAdd extends StatefulWidget {
  const PageReflectionAdd({super.key});

  @override
  State<PageReflectionAdd> createState() => _PageReflectionAddState();
}

/// _PageReflectionAddState
class _PageReflectionAddState extends State<PageReflectionAdd> {
  @override
  void initState() {
    print("PageReflectionAdd");

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: reflection_add.TemplateReflectionAdd(),
    );
  }
}
