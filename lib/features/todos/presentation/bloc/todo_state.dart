part of 'todo_bloc.dart';

@immutable
abstract class TodoState {
  final List<Todo> todos;

  const TodoState({required this.todos});
  @override
  List<Object> get props => [todos];

}

class TodoInitial extends TodoState {
  const TodoInitial({required super.todos});
}
class TodosFetch extends TodoState {
  const TodosFetch({required super.todos});
}

class TodosLoaded extends TodoState {
  const TodosLoaded({required super.todos});
}


