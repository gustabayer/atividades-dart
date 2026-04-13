import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/task_provider.dart';

// ConsumerWidget equivale ao Riverpod mas StatelessWidget.
class AddTaskField extends ConsumerWidget {
  const AddTaskField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = TextEditingController();

    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: controller,
            decoration: const InputDecoration(
              hintText: 'Nova tarefa...',
            ),
          ),
        ),
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: () {
            ref.read(taskProvider.notifier).addTask(controller.text);
            controller.clear();
          },
        ),
      ],
    );
  }
}