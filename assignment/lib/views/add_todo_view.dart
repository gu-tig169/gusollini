import 'package:assignment/model/todo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddTodo extends StatelessWidget {
  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        title: Text("Add Todo"),
        centerTitle: true,
        backgroundColor: Colors.grey[900],
      ),
      body: Column(
        children: [
          _textField(),
          _addButton(context),
        ],
      ),
    );
  }

  Widget _textField() {
    return Container(
      margin: EdgeInsets.all(20),
      child: TextField(
        controller: textEditingController,
        decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: "What are you going to do?",
            hintStyle: TextStyle(
              color: Colors.white,
            )),
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  Widget _addButton(BuildContext context) {
    return Container(
      width: 150,
      child: OutlineButton(
        borderSide: BorderSide(color: Colors.grey[800]),
        onPressed: () {
          Provider.of<TodoState>(context, listen: false)
              .addTodo(Todo(title: textEditingController.text));
          Navigator.popAndPushNamed(context, "/");
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.add),
            Container(
              width: 20,
            ),
            Text("ADD")
          ],
        ),
      ),
    );
  }
}
