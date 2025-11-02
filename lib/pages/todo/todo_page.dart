import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_todo4/controllers/controllers.dart';
import 'package:sample_todo4/pages/todo/widgets/widgets.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final todoController = context.watch<TodoController>();
    return Scaffold(
      appBar: AppBar(title: const Text('やることリスト')),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            InputTodo(
              controller: _controller,
              onAdd: () {
                todoController.addTodo(_controller.text);
                _controller.clear();
              },
            ),
            SizedBox(height: 30),
            Expanded(
              child: todoController.todo.isEmpty
                  ? NoneTodo()
                  : ListView.builder(
                      itemCount: todoController.todo.length,
                      itemBuilder: (context, index) {
                        final todo = todoController.todo[index];
                        return CardTodo(
                          todo: todo,
                          onDone: (_) => todoController.toggleTodo(index),
                          onDeleted: () => todoController.delTodo(index),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
