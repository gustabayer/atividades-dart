// model que representa uma unica tarefa
// copyWith pra imutabilidade apenas criando uma copia com campos alterados

class Task {
  final String id;
  final String title;
  final bool isCompleted;

  const Task({
    required this.id,
    required this.title,
    this.isCompleted = false,
  });

  // copyWith garantindo imutabilidade e criando copias alteradas
  Task copyWith({
    String? id,
    String? title,
    bool? isCompleted,
  }) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  @override
  String toString() => 'Task(id: $id, title: $title, isCompleted: $isCompleted)';
}