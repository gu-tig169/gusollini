import 'package:assignment/service/rest_service.dart';
import 'package:flutter/cupertino.dart';

class Todo {
  String id;
  String title;
  bool isDone;

  Todo({this.id, this.title, this.isDone = false});
}

class TodoState with ChangeNotifier {
  List<Todo> _list = [];

  TodoState() {
    _injectList();
  }

  void _injectList() async {
    this._list = await RestService.getTodos();
    notifyListeners();
  }

  List<Todo> get list => _list;

  void addTodo(Todo todo) async {
    _list = await RestService.postTodo(todo);
    notifyListeners();
  }

  void changeIsDone(Todo todo) async {
    _list = await RestService.putTodo(todo);
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

  void removeTodo(Todo todo) async {
    _list = await RestService.deleteTodo(todo);
    notifyListeners();
  }
}
