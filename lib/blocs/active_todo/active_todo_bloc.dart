import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_app_flutter_bloc/blocs/todo_list/todo_list_bloc.dart';
import 'package:todo_app_flutter_bloc/models/todo_model.dart';

part 'active_todo_event.dart';
part 'active_todo_state.dart';

class ActiveTodoBloc extends Bloc<ActiveTodoEvent, ActiveTodoState> {
  final TodoListBloc todoListBloc;
  final int initialCount;

  late final StreamSubscription todoListSubscription;

  ActiveTodoBloc({
    required this.todoListBloc,
    this.initialCount = 0,
  }) : super(ActiveTodoState(activeCount: initialCount)) {
    todoListSubscription =
        todoListBloc.stream.listen((TodoListState todoListState) {
      final List<Todo> activeTodos =
          todoListState.todos.where((todo) => !todo.completed).toList();
      add(SetActiveTodoCount(count: activeTodos.length));
    });

    on<SetActiveTodoCount>((event, emit) {
      emit(state.copyWith(count: event.count));
    });
  }

  @override
  Future<void> close() {
    todoListSubscription.cancel();
    return super.close();
  }
}
