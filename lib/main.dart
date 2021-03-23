import 'package:flutter/material.dart';

void main() {
  runApp(ToDoApp());
}

class ToDoApp extends StatelessWidget{
  @override 
  Widget build (BuildContext comtext){
    return MaterialApp(
      title: 'Todo List',
      home: new TodoList()
    );
  }
}


class TodoList extends StatefulWidget{
  @override
  createState()=> new ToDoListState();
}

class ToDoListState extends State<TodoList>{
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Todo List')
      )
    );
  }
}
