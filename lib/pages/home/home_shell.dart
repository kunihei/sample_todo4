// タブ実装２
import 'package:flutter/material.dart';
import 'package:sample_todo4/pages/todo/todo_page.dart';

class HomeShell extends StatefulWidget {
  const HomeShell({super.key});

  @override
  State<HomeShell> createState() => _HomeShellState();
}

class _HomeShellState extends State<HomeShell> {
  int _selectedIndex = 0;

  static const _screens = <Widget> [
    TodoPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) => setState(() => _selectedIndex = index),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.checklist), label: 'Todo'),
          NavigationDestination(icon: Icon(Icons.exposure_plus_1), label: 'Counter'),
        ]),
    );
  }
}