part of 'todo_list_bloc.dart';

class TodoListState extends Equatable {
  final List<Todo> todos;

  TodoListState({required this.todos});

  factory TodoListState.initial() {
    return TodoListState(todos: [
      Todo(desc: 'Shopping'),
      Todo(desc: 'Clean desk'),
      Todo(desc: 'Wash cycle'),
    ]);
  }

  TodoListState copyWith({List<Todo>? todos}) {
    return TodoListState(todos: todos ?? this.todos);
  }

  @override
  List<Object?> get props => [todos];

  @override
  String toString() => "TodoListState(todos: $todos)";
}
