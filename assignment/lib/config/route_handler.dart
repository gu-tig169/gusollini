import 'package:assignment/views/add_todo_view.dart';
import 'package:assignment/views/todo_view.dart';
import 'package:flutter/material.dart';

class RouteHandler {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // final args = settings.arguments; May be used in the future.

    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (_) => TodoView());
      case "/add-todo":
        return MaterialPageRoute(builder: (context) => AddTodo());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text("ERROR"),
        ),
        body: Center(
          child: Text("ERROR"),
        ),
      );
    });
  }
}
