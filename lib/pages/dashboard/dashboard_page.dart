// タブ実装１
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_todo4/controllers/controllers.dart';
import 'package:sample_todo4/pages/pages.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _activeTab = 0;

  final List<_DashboardTab> _tabs = [
    // _DashboardTab(label: 'Tasks', icon: Icons.view_list, child: TodoPage()),
    // _DashboardTab(label: 'Counter', icon: Icons.timer, child: CounterPage()),
    _DashboardTab(label: 'タスク', icon: Icons.view_list, builder: (_) => ChangeNotifierProvider(create: (_) => TodoController(), child: TodoPage(),)),
    _DashboardTab(label: 'カウンター', icon: Icons.timer, builder: (_) => ChangeNotifierProvider(create: (_) => CounterController(), child: CounterPage(),)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _tabs[_activeTab].builder(context),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          splashFactory:  NoSplash.splashFactory,
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          currentIndex: _activeTab,
          onTap: (index) => setState(() => _activeTab = index),
          items: _tabs
              .map(
                (tab) => BottomNavigationBarItem(
                  icon: Icon(tab.icon),
                  label: tab.label,
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

// ウィジェットをもらうパターン
// class _DashboardTab {
//   final String label;
//   final IconData icon;
//   final Widget child;

//   const _DashboardTab({
//     required this.label,
//     required this.icon,
//     required this.child,
//   });
// }

class _DashboardTab {
  final String label;
  final IconData icon;
  final WidgetBuilder builder;

  const _DashboardTab ({
    required this.label,
    required this.icon,
    required this.builder,
  });
}
