import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/bloc/todo_bloc.dart';
import 'package:todo_bloc/screen/home_screen.dart';
import 'package:todo_bloc/services/todo_service.dart';

void main() {
  // Instantiate the TodoService here
  final TodoService todoService = TodoService();

  runApp(
    BlocProvider(
      create: (context) => TodoBloc(todoService)..add(FetchTodo()),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
