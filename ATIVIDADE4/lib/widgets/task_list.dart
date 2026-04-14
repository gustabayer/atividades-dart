import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/task_provider.dart';
import '../models/task.dart';

class TaskList extends ConsumerWidget {
  const TaskList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tasks = ref.watch(taskProvider);

    final todo = tasks.where((t) => !t.isCompleted).toList();
    final done = tasks.where((t) => t.isCompleted).toList();

    return Row(
      children: [
        Expanded(child: _buildColumn(context, ref, 'A fazer', todo)),
        const SizedBox(width: 12),
        Expanded(child: _buildColumn(context, ref, 'Concluídas', done)),
      ],
    );
  }

  Widget _buildColumn(
    BuildContext context,
    WidgetRef ref,
    String title,
    List<Task> tasks,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Expanded(
          child: tasks.isEmpty
              ? const Center(child: Text('Vazio'))
              : ListView(
                  children: tasks
                      .map((task) => _buildCard(context, ref, task))
                      .toList(),
                ),
        ),
      ],
    );
  }

  Widget _buildCard(BuildContext context, WidgetRef ref, Task task) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: task.isCompleted ? Colors.green[100] : Colors.yellow[100],
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(blurRadius: 3, offset: Offset(1, 2), color: Colors.black12),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              task.title,
              style: TextStyle(
                decoration: task.isCompleted
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
              ),
            ),
          ),
          Checkbox(
            value: task.isCompleted,
            onChanged: (_) {
              ref.read(taskProvider.notifier).toggleTask(task.id);
            },
          ),
          IconButton(
            icon: const Icon(Icons.close, size: 18),
            onPressed: () {
              ref.read(taskProvider.notifier).removeTask(task.id);
            },
          ),
        ],
      ),
    );
  }
}
