import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_app_flutter_bloc/models/todo_model.dart';

part 'todo_list_event.dart';
part 'todo_list_state.dart';

class TodoListBloc extends Bloc<TodoListEvent, TodoListState> {
  TodoListBloc() : super(TodoListState.initial()) {
    on<AddTodoEvent>(_handleAddTodo);
    on<RemoveTodoEvent>(_handleRemoveTodo);
    on<ToggleTodoEvent>(_handleToggleTodo);
  }

  void _handleAddTodo(AddTodoEvent evt, Emitter emit) {
    Todo newTodo = Todo(desc: evt.desc);
    emit(state.copyWith(todos: [...state.todos, newTodo]));
  }

  void _handleRemoveTodo(RemoveTodoEvent evt, Emitter emit) {
    List<Todo> todos = state.todos.where((todo) => todo.id != evt.id).toList();
    print(todos);
    emit(state.copyWith(todos: [...todos]));
  }

  void _handleToggleTodo(ToggleTodoEvent evt, Emitter emit) {
    List<Todo> todos = state.todos.map((todo) {
      if (todo.id == evt.id) {
        return Todo(id: todo.id, desc: todo.desc, completed: !todo.completed);
      }
      return todo;
    }).toList();
    emit(state.copyWith(todos: [...todos]));
  }
}
