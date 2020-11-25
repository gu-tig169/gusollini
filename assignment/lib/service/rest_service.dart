import 'dart:convert';
import 'package:assignment/model/todo.dart';
import 'package:http/http.dart' as http;

class RestService {
  static final String _url =
      "https://todoapp-api-vldfm.ondigitalocean.app/todos";
  static final String _key = "b0b27bbb-47e3-46a0-8f0b-45bf6cc302ab";

  static Future<List<Todo>> getTodos() async {
    http.Response response = await http.get(_url + "?key=" + _key);

    print(_mapResponseToList(response));

    return _mapResponseToList(response);
  }

  static Future<List<Todo>> postTodo(Todo todo) async {
    http.Response response = await http.post(
      _url + "?key=" + _key,
      headers: <String, String>{"Content-Type": "application/json"},
      body: jsonEncode(<String, dynamic>{
        "title": todo.title,
        "done": todo.isDone,
      }),
    );

    if (response.statusCode != 200) {
      throw (Exception("Request error, Status code: ${response.statusCode}"));
    }

    return _mapResponseToList(response);
  }

  static Future<List<Todo>> putTodo(Todo todo) async {
    http.Response response = await http.put(
      _url + "/${todo.id}?key=" + _key,
      headers: <String, String>{"Content-Type": "application/json"},
      body: jsonEncode(<String, dynamic>{
        "title": todo.title,
        "done": todo.isDone,
      }),
    );

    if (response.statusCode != 200) {
      throw (Exception("Request error, Status code: ${response.statusCode}"));
    }

    return _mapResponseToList(response);
  }

  static Future<List<Todo>> deleteTodo(Todo todo) async {
    http.Response response =
        await http.delete(_url + "/${todo.id}?key=" + _key);

    if (response.statusCode != 200) {
      throw (Exception("Request error, Status code: ${response.statusCode}"));
    }

    return _mapResponseToList(response);
  }

  static List<Todo> _mapResponseToList(http.Response response) {
    List<Todo> todoList = [];
    var jsonResponseBody = response.body;

    var responseBody = jsonDecode(jsonResponseBody);

    responseBody
        .map((object) => todoList.add(Todo(
              id: object["id"],
              title: object["title"],
              isDone: object["done"],
            )))
        .toList();

    return todoList;
  }
}
