import 'package:flutter/material.dart';

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
        onSubmitted: (value) {},
      ),
    );
  }

  @override
  void dispose() {
    todoTextFieldController.dispose();
    super.dispose();
  }
}
