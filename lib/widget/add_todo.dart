import 'package:flutter/material.dart';
import 'package:todo_test1/widget/todo_form_widget.dart';
import 'package:todo_test1/model/todo.dart';
import 'package:provider/provider.dart';
import 'package:todo_test1/provider/todos.dart';

class AddTodoDialogWidget extends StatefulWidget {
  const AddTodoDialogWidget({Key? key}) : super(key: key);

  @override
  State<AddTodoDialogWidget> createState() => _AddTodoDialogWidgetState();
}

class _AddTodoDialogWidgetState extends State<AddTodoDialogWidget> {
  final _formKey = GlobalKey<FormState>();
  String title = '';
  String description = '';

  @override
  Widget build(BuildContext context) => AlertDialog(
        content: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Add todo',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  )),
              const SizedBox(height: 10),
              TodoFormWidget(
                onChangedTitle: (title) => setState(() => this.title = title),
                onChangedDescription: (description) =>
                    setState(() => this.description = description),
                onSavedTodo: addTodo,
              ),
            ],
          ),
        ),
      );
  void addTodo() {
    final isValid = _formKey.currentState?.validate();
    if (isValid != null && !isValid) {
      return;
    } else {
      final todo = Todo(
          id: DateTime.now().toString(),
          title: title,
          description: description,
          createdTime: DateTime.now());

      final provider = Provider.of<TodosProvider>(context, listen: false);
      provider.addTodo(todo);
      Navigator.of(context).pop();
    }
  }
}
