import 'package:flutter/material.dart';
import '../models/todo.dart';

class TodoProvider with ChangeNotifier {
  List<Todo> _todos = [];

  List<Todo> get todos => _todos;

  void addTodo(String title) {
    final newTodo = Todo(id: DateTime.now().toString(), title: title);
    _todos.add(newTodo);
    notifyListeners();
  }

  void toggleTodo(String id) {
    final index = _todos.indexWhere((todo) => todo.id == id);
    _todos[index].isDone = !_todos[index].isDone;
    notifyListeners();
  }

  void removeTodo(String id) {
    _todos.removeWhere((todo) => todo.id == id);
    notifyListeners();
  }
}
