import 'package:flutter/material.dart';
import 'package:todo_udevs/features/todos/presentation/screens/home/home_screen.dart';

class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ToDo App',
      theme: ThemeData(
        useMaterial3: true
      ),
      home: const HomeScreen(),
    );
  }
}
