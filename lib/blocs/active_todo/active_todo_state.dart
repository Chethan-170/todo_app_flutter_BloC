part of 'active_todo_bloc.dart';

class ActiveTodoState extends Equatable {
  final int activeCount;

  ActiveTodoState({this.activeCount = 0});

  factory ActiveTodoState.initial() {
    return ActiveTodoState(activeCount: 0);
  }

  ActiveTodoState copyWith({int? count}) {
    return ActiveTodoState(activeCount: count ?? this.activeCount);
  }

  @override
  List<Object?> get props => [activeCount];

  @override
  String toString() => "ActiveTodoState(activeCount: $activeCount)";
}
