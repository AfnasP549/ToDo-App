import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:todo_bloc/model/todo_model.dart';

class TodoService {
  final String baseUrl = 'https://api.nstack.in/v1/todos';

  // Fetch all Todo items
  Future<List<TodoModel>> getTodos() async {
    final response = await http.get(Uri.parse(baseUrl), headers: {
     // 'Authorization': 'Bearer 2a6e5977-926f-4810-8c31-acd61b04666b',
      'Content-Type': 'application/json',
    });

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
      final result = jsonResponse['items'] as List;

      // Map each JSON item to a TodoModel
      return result.map((data) => TodoModel.fromJson(data)).toList();
    } else {
      throw Exception(
          'Failed to load ToDo items. Status code: ${response.statusCode}');
    }
  }

  // Add a new Todo item
  Future<TodoModel> addTodo(String title, String description) async {
    final response = await http.post(Uri.parse(baseUrl),
        headers: {
         // 'Authorization': 'Bearer 2a6e5977-926f-4810-8c31-acd61b04666b',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          "title": title,
          "description": description,
          "is_completed": false,
        }));

    log(response.statusCode.toString());
    log(response.body);

    if (response.statusCode == 201) {
      return TodoModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load ${response.body}');
    }
  }

  // Update an existing Todo item
  Future<void> updateTodo(TodoModel todo) async {
    final url = '$baseUrl/${todo.id}'; // Corrected URL to include todo.id
    final response = await http.put(Uri.parse(url),
        headers: {
      //    'Authorization': 'Bearer 2a6e5977-926f-4810-8c31-acd61b04666b',
          'Content-Type': 'application/json',
        },
        body: json.encode(todo.toJson()));

    if (response.statusCode != 200) {
      throw Exception(
          'Failed to update Todo item. Status code: ${response.statusCode}');
    }
  }

  // Delete a Todo item
  Future<void> delete(String id) async {
    final url = '$baseUrl/$id'; // Corrected URL to include id
    final response = await http.delete(Uri.parse(url), headers: {
     // 'Authorization': 'Bearer 2a6e5977-926f-4810-8c31-acd61b04666b',
      'Content-Type': 'application/json',
    });

    if (response.statusCode != 200) {
      throw Exception(
          'Failed to delete Todo item. Status code: ${response.statusCode}');
    }
  }
}
