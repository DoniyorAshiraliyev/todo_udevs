part of 'todo_bloc.dart';

@immutable
abstract class TodoEvent {}

final class TodoFetched extends TodoEvent {
  final List<Todo> todos;

  TodoFetched(this.todos);
}

