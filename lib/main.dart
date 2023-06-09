import 'package:flutter/material.dart';
import 'package:todo_app_flutter_bloc/pages/todo_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_flutter_bloc/cubit/cubit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TodoListCubit>(
          create: (context) => TodoListCubit(),
        ),
        BlocProvider<TodoFilterCubit>(
          create: (context) => TodoFilterCubit(),
        ),
        BlocProvider<TodoSearchCubit>(
          create: (context) => TodoSearchCubit(),
        ),
        BlocProvider<ActiveTodoCountCubit>(
          create: (context) => ActiveTodoCountCubit(
            initialActiveTodoCount:
                context.read<TodoListCubit>().state.todos.length,
          ),
        ),
        BlocProvider<FilteredTodoCubit>(
          create: (context) => FilteredTodoCubit(
            initialTodos: context.read<TodoListCubit>().state.todos,
          ),
        ),
      ],
      child: MaterialApp(
        title: "Todo",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.blue),
        home: BlocListener<TodoListCubit, TodoListState>(
          listener: (context, state) {
            int count = state.todos.where((todo) => !todo.completed).length;
            context.read<ActiveTodoCountCubit>().setActiveTodoCount(count);
          },
          child: TodoPage(),
        ),
      ),
    );
  }
}
