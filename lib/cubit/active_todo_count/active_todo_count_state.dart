part of 'active_todo_count_cubit.dart';

class ActiveTodoCountState extends Equatable {
  final int activeTodoCount;

  ActiveTodoCountState({this.activeTodoCount = 0});

  factory ActiveTodoCountState.initial() {
    return ActiveTodoCountState(activeTodoCount: 0);
  }

  ActiveTodoCountState copyWith(int? count) {
    return ActiveTodoCountState(activeTodoCount: count ?? this.activeTodoCount);
  }

  @override
  List<Object?> get props => [activeTodoCount];

  @override
  String toString() =>
      "ActiveTodoCountState(activeTodoCount: $activeTodoCount)";
}
