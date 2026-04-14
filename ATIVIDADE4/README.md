# To-Do List com Flutter e Riverpod

## Descrição

Aplicação simples de lista de tarefas desenvolvida em Flutter.  
Permite ao usuário adicionar, visualizar, marcar como concluídas e remover tarefas.

As tarefas são organizadas em duas colunas:
- A fazer
- Concluídas

O status da tarefa trabalha com drag and drop, e é definido pela coluna em que ela se encontra.
Funciona de maneira similar ao kanban, onde ao card ser arrastado para a lista esquerda, se torna pendente, ao arrastar para a direita, se torna concluido

---

## Gestão de Estado

A gestão de estado foi implementada utilizando Riverpod com `StateNotifier`.

- O estado é uma lista de tarefas (`List<Task>`)
- A classe `TaskNotifier` é responsável por gerenciar alterações
- O estado é imutável: sempre que há mudança, uma nova lista é criada

Principais métodos:

- `addTask` → adiciona uma nova tarefa
- `removeTask` → remove uma tarefa
- `setCompleted` → define o status de conclusão
- `toggleTask` → alterna o estado da tarefa

Os widgets utilizam:
- `ref.watch` para escutar mudanças no estado
- `ref.read` para executar ações

---

## Gifs de Funcionamento

1. Criando Tarefas
![Criando Tarefas](arrastando_tarefa.gif)

2. Arrastando Tarefas
![Arrastando Tarefas](arrastando_tarefa.gif)

3. Removendo Tarefas
![Removendo Tarefas](removendo_tarefa.gif)


## Execução

1. Clonar o repositório:
2. Instalar dependencias
3. Executar o comando flutter run