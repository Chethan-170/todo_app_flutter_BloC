import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_flutter_bloc/blocs/active_todo/active_todo_bloc.dart';
import 'package:todo_app_flutter_bloc/blocs/filtered_todo/filtered_todo_bloc.dart';
import 'package:todo_app_flutter_bloc/blocs/todo_filter/todo_filter_bloc.dart';
import 'package:todo_app_flutter_bloc/blocs/todo_list/todo_list_bloc.dart';
import 'package:todo_app_flutter_bloc/blocs/todo_search/todo_search_bloc.dart';
import 'package:todo_app_flutter_bloc/pages/todo_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TodoListBloc(),
        ),
        BlocProvider(
          create: (context) => ActiveTodoBloc(
            todoListBloc: context.read<TodoListBloc>(),
            initialCount: context.read<TodoListBloc>().state.todos.length,
          ),
        ),
        BlocProvider(
          create: (context) => TodoSearchBloc(),
        ),
        BlocProvider(
          create: (context) => TodoFilterBloc(),
        ),
        BlocProvider(
          create: (context) => FilteredTodoBloc(
            initialTodos: context.read<TodoListBloc>().state.todos,
            todoListBloc: context.read<TodoListBloc>(),
            todoSearchBloc: context.read<TodoSearchBloc>(),
            todoFilterBloc: context.read<TodoFilterBloc>(),
          ),
        )
      ],
      child: MaterialApp(
        title: "Todo",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.blue),
        home: TodoPage(),
      ),
    );
  }
}
