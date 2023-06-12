import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_flutter_bloc/blocs/todo_list/todo_list_bloc.dart';

class CreateTodo extends StatefulWidget {
  const CreateTodo({super.key});

  @override
  State<CreateTodo> createState() => _CreateTodoState();
}

class _CreateTodoState extends State<CreateTodo> {
  final TextEditingController todoTextFieldController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: TextField(
        controller: todoTextFieldController,
        decoration: const InputDecoration(labelText: 'What to do?'),
        onSubmitted: (value) {
          if (value != null && value.trim().isNotEmpty) {
            BlocProvider.of<TodoListBloc>(context)
                .add(AddTodoEvent(desc: value));
            todoTextFieldController.clear();
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    todoTextFieldController.dispose();
    super.dispose();
  }
}
