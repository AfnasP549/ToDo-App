
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:todo_bloc/model/todo_model.dart';
import 'package:todo_bloc/services/todo_service.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final TodoService todoService;

  TodoBloc(this.todoService) : super(TodoInitial()) {
    on<FetchTodo>((event, emit) async {
      emit(TodoLoading());
      try {
        final todos = await todoService.getTodos();
        emit(TodoLoaded(todos));
        log('todosssssssssssss');
      } catch (e) {
        emit(TodoError(e.toString()));
      }
    });

    on<AddTodo>((event, emit)async{
      try{
        await todoService.addTodo(event.todo.title, event.todo.description);
        add(FetchTodo());
        log('Posted');
      }catch(e){
        emit(TodoError(e.toString()));
      }
    });



    on<UpdateTodo>((event, emit)async{
      try{
        await todoService.updateTodo(event.todo);
        add(FetchTodo());
      }catch(e){
        emit(TodoError(e.toString()));
      }
    });


    on<DeletoTodo>((event, emit)async{
      try{
        await todoService.delete(event.id);
        add(FetchTodo());
      }catch(e){
        emit(TodoError(e.toString()));
      }
    });
  }
}
