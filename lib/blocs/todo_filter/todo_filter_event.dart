part of 'todo_filter_bloc.dart';

abstract class TodoFilterEvent extends Equatable {
  const TodoFilterEvent();

  @override
  List<Object> get props => [];
}

class SetTodoFilterEvent extends TodoFilterEvent {
  final Filter filter;
  SetTodoFilterEvent({required this.filter});
}
