import 'package:flutter/foundation.dart';
import 'package:sample_todo4/models/todo.dart';

class TodoController extends ChangeNotifier {
  List<Todo> _todo = [];
  List<Todo> get todo => List.unmodifiable(_todo);

  /// やることリストを追加する
  void addTodo(String title) {
    final trimTitle = title.trim();

    // 空文字の場合は追加しない
    if (trimTitle.isEmpty) {
      return;
    }
    // 一度todoリストをコピーしてから追加する
    final List<Todo> newTodo = List.from(_todo)
      ..add(Todo(id: DateTime.now().toString(), title: trimTitle));
    _todo = newTodo;
    notifyListeners();
  }

  /// やることリストを削除する
  void delTodo(int index) {
    // indexが不正な場合は削除しない
    if (index < 0 || index >= _todo.length) {
      return;
    }

    // 一度todoリストをコピーしてから削除する
    final List<Todo> newTodo = List.from(_todo)..removeAt(index);
    _todo = newTodo;
    notifyListeners();
  }

  /// やることリストの完了・未完了を切り替える
  void toggleTodo(int index) {
    // indexが不正な場合は切り替えない
    if (index < 0 || index >= _todo.length) {
      return;
    }

    final Todo target = _todo[index];
    final List<Todo> newTodo = List.from(_todo);
    newTodo[index] = target.withCopy(isDone: !target.isDone);
    _todo = newTodo;
    notifyListeners();
  }
}
