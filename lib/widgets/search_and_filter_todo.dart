import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_flutter_bloc/blocs/todo_filter/todo_filter_bloc.dart';
import 'package:todo_app_flutter_bloc/blocs/todo_search/todo_search_bloc.dart';
import 'package:todo_app_flutter_bloc/models/debounce.dart';
import 'package:todo_app_flutter_bloc/models/todo_model.dart';
import 'package:todo_app_flutter_bloc/widgets/todo_list.dart';

class SearchFilterTodo extends StatelessWidget {
  SearchFilterTodo({super.key});

  final debounce = Debounce();

  @override
  Widget build(BuildContext context) {
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
                context
                    .read<TodoSearchBloc>()
                    .add(SetSearchTermEvent(term: value.trim().toLowerCase()));
              });
            },
          ),
          SizedBox(height: 6.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () => {
                  context
                      .read<TodoFilterBloc>()
                      .add(SetTodoFilterEvent(filter: Filter.all))
                },
                child: Text(
                  'All',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: context.watch<TodoFilterBloc>().state.filter ==
                            Filter.all
                        ? Colors.blue
                        : Colors.grey,
                  ),
                ),
              ),
              TextButton(
                onPressed: () => {
                  context
                      .read<TodoFilterBloc>()
                      .add(SetTodoFilterEvent(filter: Filter.active))
                },
                child: Text(
                  'Active',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: context.watch<TodoFilterBloc>().state.filter ==
                            Filter.active
                        ? Colors.blue
                        : Colors.grey,
                  ),
                ),
              ),
              TextButton(
                onPressed: () => {
                  context
                      .read<TodoFilterBloc>()
                      .add(SetTodoFilterEvent(filter: Filter.completed))
                },
                child: Text(
                  'Completed',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: context.watch<TodoFilterBloc>().state.filter ==
                            Filter.completed
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
