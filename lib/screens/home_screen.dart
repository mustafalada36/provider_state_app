import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';
import '../providers/counter_provider.dart';
import 'todo_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final counterProvider = Provider.of<CounterProvider>(context);
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(onPressed: () => authProvider.logout(), icon: Icon(Icons.logout)),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Counter: ${counterProvider.count}', style: TextStyle(fontSize: 24)),
            SizedBox(height: 20),
            ElevatedButton(onPressed: counterProvider.increment, child: Text('Increment')),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => TodoScreen())),
              child: Text('Go to Todo List'),
            ),
          ],
        ),
      ),
    );
  }
}
