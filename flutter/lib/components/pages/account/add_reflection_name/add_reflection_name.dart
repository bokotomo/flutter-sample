import 'package:flutter/material.dart';
import 'package:gamer_reflection/components/templates/add_reflection_name/add_reflection_name.dart'
    show TemplateAddReflectionName;

/// ページ: 振り返り名追加
class PageAccountAddReflectionName extends StatefulWidget {
  const PageAccountAddReflectionName({super.key});

  @override
  State<PageAccountAddReflectionName> createState() =>
      _PageAccountAddReflectionNameState();
}

/// _PageAccountAddReflectionNameState
class _PageAccountAddReflectionNameState
    extends State<PageAccountAddReflectionName> {
  @override
  void initState() {
    print("振り返り名追加");

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: TemplateAddReflectionName(),
    );
  }
}
