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
            decoration: InputDecoration(
              hintText: 'Nova tarefa...',
              filled: true,
              fillColor: Colors.grey[100],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),
        ElevatedButton(
          onPressed: () {
            ref.read(taskProvider.notifier).addTask(controller.text);
            controller.clear();
          },
          child: const Icon(Icons.add),
        ),
      ],
    );
  }
}
