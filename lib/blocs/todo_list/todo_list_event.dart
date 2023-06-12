part of 'todo_list_bloc.dart';

abstract class TodoListEvent extends Equatable {
  const TodoListEvent();

  @override
  List<Object> get props => [];
}

class AddTodoEvent extends TodoListEvent {
  final String desc;
  AddTodoEvent({required this.desc});
}

class RemoveTodoEvent extends TodoListEvent {
  final String id;
  RemoveTodoEvent({required this.id});
}

class ToggleTodoEvent extends TodoListEvent {
  final String id;
  ToggleTodoEvent({required this.id});
}
