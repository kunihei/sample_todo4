import 'package:flutter/material.dart';

class InputTodo extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onAdd;
  const InputTodo({super.key, required this.controller, required this.onAdd});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: controller,
            decoration: const InputDecoration(hintText: 'やることを入力してください'),
          ),
        ),
        SizedBox(width: 10),
        TextButton(onPressed: onAdd, child: const Text('追加')),
      ],
    );
  }
}
