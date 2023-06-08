import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_app_flutter_bloc/cubit/todo_filter/todo_filter_cubit.dart';
import 'package:todo_app_flutter_bloc/cubit/todo_list/todo_list_cubit.dart';
import 'package:todo_app_flutter_bloc/cubit/todo_search/todo_search_cubit.dart';
import 'package:todo_app_flutter_bloc/models/todo_model.dart';

part 'filtered_todo_cubit_state.dart';

class FilteredTodoCubitCubit extends Cubit<FilteredTodoCubitState> {
  final TodoListCubit todoListCubit;
  final TodoFilterCubit todoFilterCubit;
  final TodoSearchCubit todoSearchCubit;

  late final StreamSubscription todoListSubscription;
  late final StreamSubscription todoFilterSubscription;
  late final StreamSubscription todoSearchSubscription;

  FilteredTodoCubitCubit({
    required this.todoListCubit,
    required this.todoFilterCubit,
    required this.todoSearchCubit,
  }) : super(FilteredTodoCubitState.initial()) {
    todoListSubscription =
        todoListCubit.stream.listen((TodoListState todoListState) {});

    todoFilterSubscription =
        todoFilterCubit.stream.listen((TodoFilterState todoFilterState) {});

    todoSearchSubscription =
        todoSearchCubit.stream.listen((TodoSearchState todoSearchState) {});
  }

  void setFilteredTodos() {
    List<Todo> filteredTodos;
    switch (todoFilterCubit.state.filter) {
      case Filter.active:
        filteredTodos = todoListCubit.state.todos
            .where((Todo todo) => !todo.completed)
            .toList();
        break;
      case Filter.completed:
        filteredTodos = todoListCubit.state.todos
            .where((Todo todo) => todo.completed)
            .toList();
        break;
      case Filter.all:
      default:
        filteredTodos = todoListCubit.state.todos;
        break;
    }
    if (todoSearchCubit.state.searchTerm.isNotEmpty) {
      filteredTodos = filteredTodos
          .where((Todo todo) => todo.desc
              .toLowerCase()
              .contains(todoSearchCubit.state.searchTerm))
          .toList();
    }
    emit(state.copyWith(filteredTodos));
  }
}
