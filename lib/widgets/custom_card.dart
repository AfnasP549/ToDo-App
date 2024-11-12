import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/bloc/todo_bloc.dart';
import 'package:todo_bloc/model/todo_model.dart';
import 'package:todo_bloc/widgets/delete_confirmation.dart';

class CustomCard extends StatelessWidget {
  final TodoModel todo;

  const CustomCard({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 133, 193, 233),
      child: ListTile(
        title: Text(todo.title),
        subtitle: Text(todo.description),
        leading: Checkbox(
          value: todo.isCompleted,
          onChanged: (value) {
            final updateTodo = TodoModel(
              id: todo.id,
              createAt: todo.createAt,
              title: todo.title,
              description: todo.description,
              isCompleted: value!,
            );
            BlocProvider.of<TodoBloc>(context).add(UpdateTodo(updateTodo));
          },
          activeColor: Colors.blueAccent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        trailing: PopupMenuButton(
          onSelected: (value) {
            if (value == 'delete') {
              showDeleteConfirmationDialog(context, todo.id);
            }
          },
          itemBuilder: (context) => [
            const PopupMenuItem(
              value: 'delete',
              child: Text('Delete'),
            ),
          ],
        ),
      ),
    );
  }
}
