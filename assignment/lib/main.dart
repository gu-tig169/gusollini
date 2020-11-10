import 'package:flutter/material.dart';

void main() {
  runApp(ToDoList());
}

class ToDoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "TIG169 KSL",
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: appBar(),
      body: _list(),
      floatingActionButton: _addButton(context),
    );
  }

  Widget _addButton(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.grey[900],
      child: Icon(Icons.add),
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => AddTodo()));
      },
    );
  }

  Widget appBar() {
    return AppBar(
      title: Text("TODO List - TIG169"),
      centerTitle: true,
      backgroundColor: Colors.grey[900],
      actions: [
        IconButton(
          icon: Icon(
            Icons.more_vert,
            color: Colors.white,
          ),
          onPressed: () {},
        )
      ],
    );
  }

  Widget _list() {
    var todoList = [
      "Study",
      "Work out",
      "Read a book",
      "Shop Groceries",
      "Have fun",
    ];

    return ListView.builder(
      itemCount: todoList.length,
      itemBuilder: (context, index) => _item(todoList[index]),
    );
  }

  Widget _item(String itemName) {
    return Column(
      children: [
        ListTile(
          leading: Checkbox(
            value: true,
            onChanged: null,
          ),
          title: Text(
            itemName,
            style: TextStyle(color: Colors.white, fontSize: 34),
          ),
          trailing: IconButton(
            color: Colors.white,
            icon: Icon(Icons.close),
            onPressed: () {},
          ),
        ),
        Divider(
          color: Colors.grey[900],
        )
      ],
    );
  }
}

class AddTodo extends StatelessWidget {
  final Home home = Home();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: home.appBar(),
      body: Column(
        children: [
          _textField(),
          _addButton(),
        ],
      ),
    );
  }

  Widget _textField() {
    return Container(
      margin: EdgeInsets.all(20),
      child: TextField(
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

  Widget _addButton() {
    return Container(
      width: 150,
      child: OutlineButton(
        borderSide: BorderSide(color: Colors.grey[800]),
        onPressed: () {},
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
