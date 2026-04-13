import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/task.dart';

// TaskNotificier eh o cerebro do app
// estende StateNotifier<List<Task>> que eh classe do riverpod
// pra gerenciar um estado mutavel de forma controlada

class TaskNotifier extends StateNotifier<List<Task>> {
  // inicia null
  TaskNotifier() : super([]);

  // adiciona tarefa ao fim da lista
  // tb rejeita input nulo/vazio
  void addTask(String title) {
    final trimmed = title.trim();
    if (trimmed.isEmpty) return;

    final newTask = Task(
      id: DateTime.now().microsecondsSinceEpoch.toString(),
      title: trimmed,
    );

    // cria uma lista nova com os itens anteriores + o novo
    state = [...state, newTask];
  }

  // alterna status de conclusao por id
  void toggleTask(String id) {
    state = [
      for (final task in state)
        if (task.id == id)
          task.copyWith(isCompleted: !task.isCompleted)
        else
          task,
    ];
  }

  // remoçao de task por id
  void removeTask(String id) {
    state = state.where((task) => task.id != id).toList();
  }
}

final taskProvider = StateNotifierProvider<TaskNotifier, List<Task>>(
  (ref) => TaskNotifier(),
);