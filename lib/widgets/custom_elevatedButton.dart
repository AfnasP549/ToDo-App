import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/bloc/todo_bloc.dart';
import 'package:todo_bloc/model/todo_model.dart';
import 'package:todo_bloc/widgets/snackbar.dart';

ElevatedButton customElevatedButton(BuildContext context, TextEditingController titleController, TextEditingController descriptionController) {
  return ElevatedButton(
    onPressed: () {
      if (titleController.text.isEmpty && descriptionController.text.isEmpty) {
        showErrorMessage(message: 'Enter field', context);
      } else {
        final todo = TodoModel(
          id: '',
          createAt: DateTime.now(),
          title: titleController.text,
          description: descriptionController.text,
          isCompleted: false,
        );

        // Ensure BlocProvider is used correctly
        BlocProvider.of<TodoBloc>(context).add(AddTodo(todo));

        // Clear the controllers
        titleController.clear();
        descriptionController.clear();

        // Show success message
        showSuccessMessage(context, message: 'Success');

        // Pop the screen to go back
        Navigator.pop(context);
      }
    },
    style: ElevatedButton.styleFrom(
      minimumSize: const Size(double.infinity, 50),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
    ),
    child: const Text(
      'Submit',
      style: TextStyle(fontWeight: FontWeight.bold),
    ),
  );
}
