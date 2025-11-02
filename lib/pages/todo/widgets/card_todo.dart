import 'package:flutter/material.dart';
import 'package:sample_todo4/models/models.dart';


class CardTodo extends StatelessWidget {
  final Todo todo;
  final ValueChanged<bool?> onDone;
  final VoidCallback onDeleted;
  const CardTodo({super.key, required this.todo, required this.onDone, required this.onDeleted});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Checkbox(value: todo.isDone, onChanged: onDone),
          Expanded(child: Text(todo.title)),
          IconButton(onPressed: onDeleted, icon: Icon(Icons.delete))
        ],
      ),
    );
  }
}