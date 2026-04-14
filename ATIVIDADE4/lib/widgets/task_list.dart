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
        Expanded(
          child: _buildColumn(context, ref, 'A fazer', todo, false),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _buildColumn(context, ref, 'Concluídas', done, true),
        ),
      ],
    );
  }

  Widget _buildColumn(
    BuildContext context,
    WidgetRef ref,
    String title,
    List<Task> tasks,
    bool isCompletedColumn,
  ) {
    return DragTarget<Task>(
      onAccept: (task) {
        ref
            .read(taskProvider.notifier)
            .setCompleted(task.id, isCompletedColumn);
      },
      builder: (context, candidateData, rejectedData) {
        return SizedBox.expand(
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: candidateData.isNotEmpty
                  ? Colors.blue[50]
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Expanded(
                  child: tasks.isEmpty
                      ? const Center(child: Text('Vazio'))
                      : ListView.builder(
                          itemCount: tasks.length,
                          itemBuilder: (context, index) {
                            final task = tasks[index];
                            return _buildCard(context, ref, task);
                          },
                        ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildCard(BuildContext context, WidgetRef ref, Task task) {
    return Draggable<Task>(
      data: task,
      feedback: Material(
        child: ConstrainedBox(
          // 🔥 ESSENCIAL
          constraints: const BoxConstraints(
            minWidth: 100,
            maxWidth: 200,
          ),
          child: _cardUI(task),
        ),
      ),
      childWhenDragging: Opacity(
        opacity: 0.3,
        child: _cardUI(task, ref: ref),
      ),
      child: _cardUI(task, ref: ref),
    );
  }

  Widget _cardUI(Task task, {WidgetRef? ref, bool isDragging = false}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: task.isCompleted ? Colors.green[100] : Colors.yellow[100],
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            blurRadius: 3,
            offset: Offset(1, 2),
            color: Colors.black12,
          ),
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

          // REMOVIDO CHECKBOX

          if (ref != null)
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
