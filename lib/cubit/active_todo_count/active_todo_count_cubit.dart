import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_app_flutter_bloc/cubit/todo_list/todo_list_cubit.dart';

part 'active_todo_count_state.dart';

class ActiveTodoCountCubit extends Cubit<ActiveTodoCountState> {
  final TodoListCubit todoListCubit;
  final int initialActiveTodoCount;
  late final StreamSubscription todoListStreamSubscription;

  ActiveTodoCountCubit(
      {required this.initialActiveTodoCount, required this.todoListCubit})
      : super(ActiveTodoCountState(activeTodoCount: initialActiveTodoCount)) {
    todoListStreamSubscription =
        todoListCubit.stream.listen((TodoListState todoListState) {
      final int count =
          todoListState.todos.where((todo) => !todo.completed).toList().length;
      emit(state.copyWith(count));
    });
  }

  @override
  Future<void> close() {
    todoListStreamSubscription.cancel();
    return super.close();
  }
}
