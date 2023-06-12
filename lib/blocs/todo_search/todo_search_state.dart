part of 'todo_search_bloc.dart';

class TodoSearchState extends Equatable {
  final String searchTerm;

  TodoSearchState({this.searchTerm = ''});

  factory TodoSearchState.initial() => TodoSearchState(searchTerm: '');

  TodoSearchState copyWith(String? term) =>
      TodoSearchState(searchTerm: term ?? this.searchTerm);

  @override
  List<Object?> get props => [searchTerm];

  @override
  String toString() => "TodoSearchState(searchTerm: $searchTerm)";
}
