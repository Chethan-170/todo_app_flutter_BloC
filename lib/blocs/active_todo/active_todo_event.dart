part of 'active_todo_bloc.dart';

abstract class ActiveTodoEvent extends Equatable {
  const ActiveTodoEvent();

  @override
  List<Object> get props => [];
}

class SetActiveTodoCount extends ActiveTodoEvent {
  final int count;
  SetActiveTodoCount({this.count = 0});
}
