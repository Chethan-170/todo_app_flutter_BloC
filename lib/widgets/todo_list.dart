import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_flutter_bloc/cubit/filtered_todo_cubit/filtered_todo_cubit_cubit.dart';
import 'package:todo_app_flutter_bloc/cubit/todo_list/todo_list_cubit.dart';
import 'package:todo_app_flutter_bloc/models/todo_model.dart';
import 'package:todo_app_flutter_bloc/widgets/todo_item.dart';

class TodoList extends StatelessWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Todo> todos =
        context.watch<FilteredTodoCubit>().state.filteredTodos;

    return Expanded(
      child: ListView.separated(
        itemCount: todos.length,
        separatorBuilder: (context, index) {
          return Divider(color: Colors.grey);
        },
        itemBuilder: (BuildContext context, int index) {
          final Todo todo = todos[index];
          return Dismissible(
            key: ValueKey(todo.id),
            background: _showDismissibleBackground(0),
            secondaryBackground: _showDismissibleBackground(1),
            child: TodoItem(todo: todo),
            onDismissed: (_) {
              BlocProvider.of<TodoListCubit>(context).removeTodo(todo);
            },
          );
        },
      ),
    );
  }

  Widget _showDismissibleBackground(int direction) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 6),
      alignment: direction == 0 ? Alignment.centerLeft : Alignment.centerRight,
      color: Colors.red,
      child: Icon(
        Icons.delete,
        color: Colors.white,
        size: 30.0,
      ),
    );
  }
}
