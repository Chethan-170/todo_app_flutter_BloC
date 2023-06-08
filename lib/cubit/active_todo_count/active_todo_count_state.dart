part of 'active_todo_count_cubit.dart';

class ActiveTodoCountState extends Equatable {
  final int activeTodoCountState;

  ActiveTodoCountState({this.activeTodoCountState = 0});

  factory ActiveTodoCountState.initial() {
    return ActiveTodoCountState(activeTodoCountState: 0);
  }

  ActiveTodoCountState copyWith(int? count) {
    return ActiveTodoCountState(
        activeTodoCountState: count ?? this.activeTodoCountState);
  }

  @override
  List<Object?> get props => [ActiveTodoCountState];

  @override
  String toString() =>
      "ActiveTodoCountState(ActiveTodoCountState: $ActiveTodoCountState)";
}
