import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/auth_provider.dart';
import 'providers/counter_provider.dart';
import 'providers/todo_provider.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => CounterProvider()),
        ChangeNotifierProvider(create: (_) => TodoProvider()),
      ],
      child: Consumer<AuthProvider>(
        builder: (context, auth, _) {
          return MaterialApp(
            debugShowCheckedModeBanner: true,
            title: 'Provider App',
            home: auth.isLoggedIn ? HomeScreen() : LoginScreen(),
          );
        },
      ),
    );
  }
}
