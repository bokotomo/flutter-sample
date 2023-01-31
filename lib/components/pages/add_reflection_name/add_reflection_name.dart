import 'package:flutter/material.dart';
import 'package:gamer_reflection/components/templates/add_reflection_name/add_reflection_name.dart'
    as add_reflection_name;

/// ページ: 振り返り名追加
class PageAddReflectionName extends StatefulWidget {
  const PageAddReflectionName({super.key});

  @override
  State<PageAddReflectionName> createState() => _PageAddReflectionNameState();
}

/// _PageAddReflectionNameState
class _PageAddReflectionNameState extends State<PageAddReflectionName> {
  @override
  void initState() {
    print("振り返り名追加");

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: add_reflection_name.TemplateAddReflectionName(),
    );
  }
}
