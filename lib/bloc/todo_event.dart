part of 'todo_bloc.dart';

abstract class TodoEvent{}

class FetchTodo extends TodoEvent{}

class AddTodo extends TodoEvent{
  final TodoModel todo;

  AddTodo(this.todo);
}

class UpdateTodo extends TodoEvent{
  final TodoModel todo;

  UpdateTodo( this.todo);
}

class DeletoTodo extends TodoEvent{
  final String id;

  DeletoTodo(this.id);
}


