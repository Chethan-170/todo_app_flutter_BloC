import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_app_flutter_bloc/blocs/todo_filter/todo_filter_bloc.dart';
import 'package:todo_app_flutter_bloc/blocs/todo_list/todo_list_bloc.dart';
import 'package:todo_app_flutter_bloc/blocs/todo_search/todo_search_bloc.dart';
import 'package:todo_app_flutter_bloc/models/todo_model.dart';

part 'filtered_todo_event.dart';
part 'filtered_todo_state.dart';

class FilteredTodoBloc extends Bloc<FilteredTodoEvent, FilteredTodoState> {
  final List<Todo> initialTodos;
  final TodoListBloc todoListBloc;
  final TodoSearchBloc todoSearchBloc;
  final TodoFilterBloc todoFilterBloc;

  late final StreamSubscription todoListBlocSubscription;
  late final StreamSubscription todoSearchBlocSubscription;
  late final StreamSubscription todoFilterBlocSubscription;

  FilteredTodoBloc({
    this.initialTodos = const [],
    required this.todoListBloc,
    required this.todoSearchBloc,
    required this.todoFilterBloc,
  }) : super(FilteredTodoState(filteredTodos: initialTodos)) {
    todoListBlocSubscription = todoListBloc.stream.listen((event) {
      add(SetFilteredTodoEvent());
    });

    todoSearchBlocSubscription = todoSearchBloc.stream.listen((event) {
      add(SetFilteredTodoEvent());
    });

    todoFilterBlocSubscription = todoFilterBloc.stream.listen((event) {
      add(SetFilteredTodoEvent());
    });

    on<SetFilteredTodoEvent>(_handleSetFilteredTodoEvent);
  }

  void _handleSetFilteredTodoEvent(SetFilteredTodoEvent evt, Emitter emit) {
    List<Todo> allTodos = todoListBloc.state.todos;
    String searchTerm = todoSearchBloc.state.searchTerm;
    Filter filter = todoFilterBloc.state.filter;
    List<Todo> newTodos = [];

    switch (filter) {
      case Filter.active:
        newTodos = allTodos.where((todo) => !todo.completed).toList();
        break;
      case Filter.completed:
        newTodos = allTodos.where((todo) => todo.completed).toList();
        break;
      case Filter.all:
      default:
        newTodos = allTodos;
        break;
    }

    if (searchTerm.trim().isNotEmpty) {
      newTodos = newTodos
          .where((todo) =>
              todo.desc.toLowerCase().contains(searchTerm.toLowerCase().trim()))
          .toList();
    }

    emit(state.copyWith(todos: newTodos));
  }

  @override
  Future<void> close() {
    todoListBlocSubscription.cancel();
    todoSearchBlocSubscription.cancel();
    todoFilterBlocSubscription.cancel();
    return super.close();
  }
}
