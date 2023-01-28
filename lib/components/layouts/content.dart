import 'package:flutter/material.dart';
import 'package:gamer_reflection/components/frames/footer.dart' as footer;
import 'package:gamer_reflection/components/screens/task.dart';
import 'package:gamer_reflection/components/screens/ranking.dart';
import 'package:gamer_reflection/components/screens/reflection.dart';

/// home
Widget home(
  List<StatelessWidget> screens,
  int selectedIndex,
  void Function(int) onItemTapped,
) {
  return Scaffold(
    body: screens[selectedIndex],
    bottomNavigationBar: footer.Footer(
      onItemTapped: onItemTapped,
      selectedIndex: selectedIndex,
    ),
  );
}

/// Footer
class Content extends StatefulWidget {
  const Content({super.key});

  @override
  State<Content> createState() => _ContentState();
}

/// _ContentState
class _ContentState extends State<Content> {
  static const _screens = [
    TaskScreen(),
    ReflectionScreen(),
    RankingScreen(),
  ];
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: home(
        _screens,
        _selectedIndex,
        _onItemTapped,
      ),
    );
  }
}
