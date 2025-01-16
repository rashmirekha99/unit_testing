import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unit_testing/models/todo_model.dart';
import 'package:unit_testing/screens/todo_screen.dart';

void main() {
  testWidgets(
      'given todo screen when todo list called then todo list should shown in listview',
      (tester) async {
    final todoList = [
      TodoModel(
          userId: 1, id: 1, title: "delectus aut autem", completed: false),
      TodoModel(
          userId: 1,
          id: 2,
          title: "quis ut nam facilis et officia qui",
          completed: false),
    ];
    Future<List<TodoModel>> mockTodo() async {
      return todoList;
    }

    await tester.pumpWidget(MaterialApp(
      home: TodoScreen(
        todos: mockTodo(),
      ),
    ));

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    await tester.pumpAndSettle();
    expect(find.byType(ListTile), findsNWidgets(todoList.length));
    for (final todo in todoList) {
      expect(find.text(todo.title), findsOneWidget);
    }
  });
}
