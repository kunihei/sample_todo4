import 'package:flutter/material.dart';

class NoneTodo extends StatelessWidget {
  const NoneTodo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: const Text(
        'やることリストがありません',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
      ),
    );
  }
}
