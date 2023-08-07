import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:todo_udevs/features/todos/data/data_source/local_data_source.dart';
import 'package:todo_udevs/features/todos/domain/entity/todo/todo.dart';
part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(const TodosFetch(todos: [])) {
    // on<TodoInitial>((event, emit) {
    //   emit(TodosFetch(todos: []));
    // });
    on<TodoFetched>((event,emit) async {
      List<Todo> items = [];
      items = await SqlDatabase.readAll();
      emit(TodosLoaded(todos: items));

      // void getAllData() async {
      //
      // }
    });
  }
}
