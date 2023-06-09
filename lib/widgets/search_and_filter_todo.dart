import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_flutter_bloc/cubit/todo_filter/todo_filter_cubit.dart';
import 'package:todo_app_flutter_bloc/cubit/todo_search/todo_search_cubit.dart';
import 'package:todo_app_flutter_bloc/models/debounce.dart';
import 'package:todo_app_flutter_bloc/models/todo_model.dart';
import 'package:todo_app_flutter_bloc/widgets/todo_list.dart';

class SearchFilterTodo extends StatelessWidget {
  SearchFilterTodo({super.key});

  final debounce = Debounce();

  @override
  Widget build(BuildContext context) {
    final Filter currentFilter = context.watch<TodoFilterCubit>().state.filter;
    return Expanded(
      child: Column(
        children: [
          TextField(
            decoration: const InputDecoration(
              labelText: "Search Todos..",
              border: InputBorder.none,
              filled: true,
              prefixIcon: Icon(Icons.search),
            ),
            onChanged: (value) {
              debounce.run(() {
                context.read<TodoSearchCubit>().setSearchTerm(value);
              });
            },
          ),
          SizedBox(height: 6.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () =>
                    context.read<TodoFilterCubit>().changeFilter(Filter.all),
                child: Text(
                  'All',
                  style: TextStyle(
                    fontSize: 18.0,
                    color:
                        currentFilter == Filter.all ? Colors.blue : Colors.grey,
                  ),
                ),
              ),
              TextButton(
                onPressed: () =>
                    context.read<TodoFilterCubit>().changeFilter(Filter.active),
                child: Text(
                  'Active',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: currentFilter == Filter.active
                        ? Colors.blue
                        : Colors.grey,
                  ),
                ),
              ),
              TextButton(
                onPressed: () => context
                    .read<TodoFilterCubit>()
                    .changeFilter(Filter.completed),
                child: Text(
                  'Completed',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: currentFilter == Filter.completed
                        ? Colors.blue
                        : Colors.grey,
                  ),
                ),
              ),
            ],
          ),
          TodoList()
        ],
      ),
    );
  }
}
