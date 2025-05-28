import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/todo.dart';
import '../providers/todo_provider.dart';

class TodoTile extends StatelessWidget {
  final Todo todo;

  const TodoTile({required this.todo});

  @override
  Widget build(BuildContext context) {
    final todoProvider = Provider.of<TodoProvider>(context, listen: false);
    return ListTile(
      title: Text(
        todo.title,
        style: TextStyle(
          decoration: todo.isDone ? TextDecoration.lineThrough : null,
        ),
      ),
      leading: Checkbox(
        value: todo.isDone,
        onChanged: (_) => todoProvider.toggleTodo(todo.id),
      ),
      trailing: IconButton(
        icon: Icon(Icons.delete),
        onPressed: () => todoProvider.removeTodo(todo.id),
      ),
    );
  }
}
