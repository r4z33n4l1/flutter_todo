import 'package:flutter/material.dart';
import 'package:todo_test1/page/home_page.dart';
import 'package:todo_test1/provider/todos.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static const String title = "Razeen's Todo";

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => TodosProvider(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: title,
          theme: ThemeData(
            primarySwatch: Colors.orange,
            scaffoldBackgroundColor: Colors.yellow[50],
          ),
          home: const HomePage(),
        ));
  }
}
