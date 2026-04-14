import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'widgets/add_task_field.dart';
import 'widgets/task_list.dart';

void main() {
  // providerScope envolve toda a arvore de widgets
  // tb é onde o riverpod armazena os estados dos providers
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To-Do List',
      debugShowCheckedModeBanner: false,
      home: const TodoScreen(),
    );
  }
}

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tarefas')),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            // adiçao encapsulada no widget
            AddTaskField(),
            SizedBox(height: 16),
            Expanded(child: TaskList()),
          ],
        ),
      ),
    );
  }
}