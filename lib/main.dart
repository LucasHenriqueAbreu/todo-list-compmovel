import 'package:flutter/material.dart';
import 'package:todo/app/views/todo_list/todo_list_view.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.amber,
        ),
      ),
      title: 'Todo List',
      debugShowCheckedModeBanner: false,
      home: const TodoListView(),
    );
  }
}
