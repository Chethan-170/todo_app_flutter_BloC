part of 'filtered_todo_cubit_cubit.dart';

class FilteredTodoCubitState extends Equatable {
  final List<Todo> filteredTodos;

  FilteredTodoCubitState({required this.filteredTodos});

  factory FilteredTodoCubitState.initial() {
    return FilteredTodoCubitState(filteredTodos: []);
  }

  FilteredTodoCubitState copyWith(List<Todo>? todos) {
    return FilteredTodoCubitState(filteredTodos: todos ?? this.filteredTodos);
  }

  @override
  List<Object?> get props => [filteredTodos];

  @override
  String toString() => "FilteredTodoCubitState(filteredTodos: $filteredTodos);";
}
