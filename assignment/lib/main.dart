import 'package:assignment/model/todo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'config/route_handler.dart';

void main() {
  var todoState = TodoState();

  runApp(
    ChangeNotifierProvider(
      create: (context) => todoState,
      child: ToDoList(),
    ),
  );
}

class ToDoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "TIG169",
      initialRoute: "/",
      onGenerateRoute: RouteHandler.generateRoute,
    );
  }
}
