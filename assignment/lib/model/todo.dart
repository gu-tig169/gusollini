import 'package:flutter/cupertino.dart';

class Todo {
  String title;
  bool isDone;

  Todo({this.title, this.isDone = false});
}

class TodoState with ChangeNotifier {
  List<Todo> _list = [];

  List<Todo> get list => _list;

  void addTodo(Todo todo) {
    _list.add(todo);
    notifyListeners();
  }

  List<Todo> filteredList(String filter) {
    if (filter == "Done") {
      return _list.where((todo) => todo.isDone == true).toList();
    } else if (filter == "Not Done") {
      return _list.where((todo) => todo.isDone == false).toList();
    }

    return _list;
  }

  void removeTodo(Todo todo) {
    _list.remove(todo);
    notifyListeners();
  }
}
