import 'dart:convert';

import 'package:http/http.dart';
import 'package:unit_testing/models/todo_model.dart';

class TodoServices {
  Client http;
  TodoServices(this.http);

  Future<List<TodoModel>> getTodo() async {
    try {
      final response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/todos/'));

      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);

        return data.map((todo) => TodoModel.fromMap(todo)).toList();
      } else {
        throw Exception();
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
