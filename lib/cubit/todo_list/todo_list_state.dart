part of 'todo_list_cubit.dart';

class TodoListState extends Equatable {
  final List<Todo> todos;

  TodoListState({required this.todos});

  factory TodoListState.initial() {
    return TodoListState(todos: [
      Todo(desc: 'Clean the room'),
      Todo(desc: 'Read the book'),
      Todo(desc: 'Wash the car'),
    ]);
  }

  TodoListState copyWith(List<Todo>? todos) {
    return TodoListState(todos: todos ?? this.todos);
  }

  @override
  List<Object?> get props => [todos];

  @override
  String toString() => "TodoListState(todos: ${todos})";
}
