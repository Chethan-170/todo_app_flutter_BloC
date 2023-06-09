import 'package:flutter/material.dart';
import 'package:todo_app_flutter_bloc/widgets/create_todo.dart';
import 'package:todo_app_flutter_bloc/widgets/search_and_filter_todo.dart';
import 'package:todo_app_flutter_bloc/widgets/top_header.dart';

class TodoPage extends StatelessWidget {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              TopHeader(),
              CreateTodo(),
              SizedBox(height: 12.0),
              SearchFilterTodo(),
            ],
          ),
        ),
      ),
    );
  }
}
