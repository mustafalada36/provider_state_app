import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/todo_provider.dart';
import '../widgets/todo_tile.dart';

class TodoScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final todoProvider = Provider.of<TodoProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Todo List')),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(12),
            child: Row(
              children: [
                Expanded(child: TextField(controller: _controller)),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    if (_controller.text.trim().isNotEmpty) {
                      todoProvider.addTodo(_controller.text.trim());
                      _controller.clear();
                    }
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: todoProvider.todos.length,
              itemBuilder: (_, index) {
                final todo = todoProvider.todos[index];
                return TodoTile(todo: todo);
              },
            ),
          ),
        ],
      ),
    );
  }
}
