import 'package:flutter/material.dart';
import 'package:gamer_reflection/components/layouts/content.dart' as content;

///
const title = 'Gamer Reflection';

///
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      theme: ThemeData(
        // primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const content.Content(),
    );
  }
}
