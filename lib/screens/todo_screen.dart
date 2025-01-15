import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:unit_testing/models/todo_model.dart';
import 'package:unit_testing/services/todo_servvices.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  late Future<List<TodoModel>> todos;
  TodoServices todoServices = TodoServices(Client());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    todos = todoServices.getTodo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todos'),
      ),
      body: FutureBuilder(
          future: todos,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator.adaptive();
            } else if (snapshot.hasError) {
              return const Text('No Todos');
            } else if (snapshot.hasData) {
              final todo = snapshot.data;
              return ListView.builder(itemBuilder: (context, index) {
                return ListTile(
                  title: Text(todo![index].title),
                  subtitle: Text(todo[index].id.toString()),
                );
              });
            } else {
              return const SizedBox();
            }
          }),
    );
  }
}
