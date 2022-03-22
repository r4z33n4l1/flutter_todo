import 'package:flutter/cupertino.dart';
import 'package:todo_test1/model/todo.dart';

class TodosProvider extends ChangeNotifier {
  List<Todo> _todos = [
    Todo(
        createdTime: DateTime.now(),
        title: 'Todo 1',
        description:
            'Yoooo adbsjahdjashd asdh jasdhajshdja sdhasjdhasjdhas jdhasj '),
    Todo(createdTime: DateTime.now(), title: 'Todo 2', description: 'EEEE'),
    Todo(createdTime: DateTime.now(), title: 'Todo 3', description: 'RRRR'),
    Todo(
        createdTime: DateTime.now(),
        title: 'Todo 4',
        description: 'MMMM adsadasd sdsa dasdadad'),
    Todo(
        createdTime: DateTime.now(),
        title: 'Todo 1',
        description:
            'Yoooo adbsjahdjashd asdh jasdhajshdja sdhasjdhasjdhas jdhasj '),
  ];

  List<Todo> get todos => _todos.where((todo) => !todo.isDone).toList();
  List<Todo> get todosCompleted => _todos.where((todo) => todo.isDone).toList();

  void addTodo(Todo todo) {
    _todos.add(todo);
    notifyListeners();
  }

  void removeTodo(Todo todo) {
    _todos.remove(todo);
    notifyListeners();
  }

  bool toggleTodoStatus(Todo todo) {
    todo.isDone = !todo.isDone;
    notifyListeners();

    return todo.isDone;
  }
}
