import 'package:flutter/material.dart';
import 'package:todo_test1/model/todo.dart';
import 'package:todo_test1/widget/todo_widget.dart';
import 'package:provider/provider.dart';
import 'package:todo_test1/provider/todos.dart';

class TodoListWidget extends StatelessWidget {
  const TodoListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodosProvider>(context);
    final todos = provider.todos;

    return todos.isEmpty
        ? Center(
            child: Text(
              'None',
              style: TextStyle(fontSize: 20),
            ),
          )
        : ListView.separated(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.all(12),
            separatorBuilder: (context, index) => Container(
              height: 6,
            ),
            itemCount: todos.length,
            itemBuilder: (context, index) {
              final todo = todos[index];
              return TodoWidget(todo: todo);
            },
          );
  }
}
