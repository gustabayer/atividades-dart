import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/task_provider.dart';

class TaskList extends ConsumerWidget {
  const TaskList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tasks = ref.watch(taskProvider);

    if (tasks.isEmpty) {
      return const Center(child: Text('Nenhuma tarefa ainda.'));
    }

    // ListView.builder cria itens sob demanda
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        final task = tasks[index];

        return ListTile(
          title: Text(
            task.title,
            style: TextStyle(
              decoration: task.isCompleted
                  ? TextDecoration.lineThrough
                  : TextDecoration.none,
              color: task.isCompleted ? Colors.grey : null,
            ),
          ),

          leading: Checkbox(
            value: task.isCompleted,
            onChanged: (_) {
              ref.read(taskProvider.notifier).toggleTask(task.id);
            },
          ),

          trailing: IconButton(
            icon: const Icon(Icons.delete, color: Colors.red),
            onPressed: () {
              ref.read(taskProvider.notifier).removeTask(task.id);
            },
          ),
        );
      },
    );
  }
}