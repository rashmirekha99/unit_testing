import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:unit_testing/models/todo_model.dart';
import 'package:unit_testing/services/todo_servvices.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key, required this.todos});
  final Future<List<TodoModel>> todos;

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  TodoServices todoServices = TodoServices(Client());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.todos);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todos'),
      ),
      body: FutureBuilder(
          future: widget.todos,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator.adaptive());
            } else if (snapshot.hasError) {
              return const Text('No Todos');
            } else if (snapshot.hasData) {
              final todo = snapshot.data;
              return ListView.builder(
                  itemCount: todo!.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(todo[index].title),
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
