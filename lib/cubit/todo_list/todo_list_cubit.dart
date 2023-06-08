import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_app_flutter_bloc/models/todo_model.dart';

part 'todo_list_state.dart';

class TodoListCubit extends Cubit<TodoListState> {
  TodoListCubit() : super(TodoListState.initial());

  void addTodo(String desc) {
    Todo newTodo = Todo(desc: desc);
    emit(state.copyWith([...state.todos, newTodo]));
  }

  void editTodo(String todoId, String todoDesc) {
    final List<Todo> newTodos = state.todos.map((Todo todo) {
      if (todo.id == todoId) {
        return Todo(id: todo.id, desc: todoDesc, completed: todo.completed);
      }
      return todo;
    }).toList();

    emit(state.copyWith(newTodos));
  }

  void toggleTodo(String id) {
    final List<Todo> newTodos = state.todos.map((todo) {
      if (todo.id == id) {
        return Todo(id: todo.id, desc: todo.desc, completed: !todo.completed);
      }
      return todo;
    }).toList();

    emit(state.copyWith(newTodos));
  }

  void removeTodo(Todo todo) {
    final List<Todo> newTodos =
        state.todos.where((td) => td.id != todo.id).toList();
    emit(state.copyWith(newTodos));
  }
}
