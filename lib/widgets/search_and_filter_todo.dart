import 'package:flutter/material.dart';
import 'package:todo_app_flutter_bloc/models/debounce.dart';
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
            onChanged: (value) {},
          ),
          SizedBox(height: 6.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () => {},
                child: Text(
                  'All',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.grey,
                  ),
                ),
              ),
              TextButton(
                onPressed: () => {},
                child: Text(
                  'Active',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.grey,
                  ),
                ),
              ),
              TextButton(
                onPressed: () => {},
                child: Text(
                  'Completed',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.grey,
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
