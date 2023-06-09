import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_flutter_bloc/cubit/todo_list/todo_list_cubit.dart';
import 'package:todo_app_flutter_bloc/models/todo_model.dart';

class TodoItem extends StatefulWidget {
  final Todo todo;
  const TodoItem({super.key, required this.todo});

  @override
  State<TodoItem> createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        value: widget.todo.completed,
        onChanged: (bool? checked) {
          context.read<TodoListCubit>().toggleTodo(widget.todo.id);
        },
      ),
      title: Text(widget.todo.desc),
    );
  }
}