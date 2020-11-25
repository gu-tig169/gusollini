import 'package:assignment/model/todo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TodoView extends StatefulWidget {
  @override
  _TodoViewState createState() => _TodoViewState();
}

class _TodoViewState extends State<TodoView> {
  final List<String> _filterList = ["All", "Done", "Not Done"];
  String _filterValue = "All";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        title: Text("TODO List - TIG169"),
        centerTitle: true,
        backgroundColor: Colors.grey[900],
        actions: [
          PopupMenuButton<String>(onSelected: (String value) {
            setState(() {
              _filterValue = value;
              print(_filterValue);
            });
          }, itemBuilder: (context) {
            return _filterList
                .map((filter) =>
                    PopupMenuItem(value: filter, child: Text(filter)))
                .toList();
          }),
        ],
      ),
      body: Consumer<TodoState>(
          builder: (context, state, child) =>
              _list(state.filteredList(_filterValue))),
      floatingActionButton: _addButton(context),
    );
  }

  Widget _addButton(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.grey[900],
      child: Icon(Icons.add),
      onPressed: () {
        Navigator.pushNamed(context, "/add-todo");
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

  Widget _list(List<Todo> todoList) {
    return ListView.builder(
      itemCount: todoList.length,
      itemBuilder: (context, index) => _item(todoList[index], index),
    );
  }

  Widget _item(Todo todoItem, int index) {
    return Column(
      children: [
        ListTile(
          leading: Checkbox(
            value: todoItem.isDone,
            onChanged: (bool value) {
              setState(() {
                todoItem.isDone = value;
                Provider.of<TodoState>(context, listen: false)
                    .changeIsDone(todoItem);
              });
            },
          ),
          title: Text(
            todoItem.title,
            style: TextStyle(color: Colors.white, fontSize: 34),
          ),
          trailing: IconButton(
            color: Colors.white,
            icon: Icon(Icons.close),
            onPressed: () {
              Provider.of<TodoState>(context, listen: false)
                  .removeTodo(todoItem);
            },
          ),
        ),
        Divider(
          color: Colors.grey[900],
        )
      ],
    );
  }
}
