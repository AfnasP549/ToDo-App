import 'package:flutter/material.dart';
import 'package:todo_bloc/widgets/custom_appbar.dart';
import 'package:todo_bloc/widgets/custom_elevatedButton.dart';

class AddScreen extends StatelessWidget {
  AddScreen({
    super.key,
  });

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('Add ToDo'),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextFormField(
                  controller: titleController,
                  decoration: InputDecoration(
                      hintText: 'title',
                      hintStyle: const TextStyle(
                        color: Colors.grey,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: descriptionController,
                  decoration: InputDecoration(
                      hintText: 'description',
                      hintStyle: const TextStyle(
                        color: Colors.grey,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                  minLines: 5,
                  maxLines: 8,
                ),
                const SizedBox(
                  height: 20,
                ),
                customElevatedButton(context, titleController, descriptionController)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
