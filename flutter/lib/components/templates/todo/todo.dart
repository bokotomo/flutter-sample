import 'package:flutter/material.dart'
    show Widget, BuildContext, StatelessWidget;
import 'package:gamer_reflection/components/templates/todo/view.dart' show view;

/// テンプレート: やることリスト
class TemplateTodo extends StatelessWidget {
  const TemplateTodo({super.key});

  @override
  Widget build(BuildContext context) {
    return view(context);
  }
}
