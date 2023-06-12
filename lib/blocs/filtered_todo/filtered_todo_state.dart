part of 'filtered_todo_bloc.dart';

class FilteredTodoState extends Equatable {
  final List<Todo> filteredTodos;

  FilteredTodoState({this.filteredTodos = const []});

  factory FilteredTodoState.initial() {
    return FilteredTodoState(filteredTodos: []);
  }

  FilteredTodoState copyWith({List<Todo> todos = const []}) {
    return FilteredTodoState(filteredTodos: todos);
  }

  @override
  List<Object?> get props => [filteredTodos];

  @override
  String toString() => "FilteredTodoState(filteredTodos: $filteredTodos)";
}
