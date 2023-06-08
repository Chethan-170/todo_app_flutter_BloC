part of 'todo_search_cubit.dart';

class TodoSearchState extends Equatable {
  final String searchTerm;

  TodoSearchState({this.searchTerm = ""});

  factory TodoSearchState.initial() {
    return TodoSearchState(searchTerm: "");
  }

  TodoSearchState copyWith(String? term) {
    return TodoSearchState(searchTerm: term ?? this.searchTerm);
  }

  @override
  List<Object?> get props => [searchTerm];

  @override
  String toString() => "TodoSearchState(searchTerm: ${searchTerm})";
}
