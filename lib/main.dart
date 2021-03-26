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
  List<String> _todoItems=[];

  void _addTodoItem(){
    setState((){
      int index=_todoItems.length;
      _todoItems.add('Item'+index.toString());
    });
  }


  Widget _buildTodoList(){
    return new ListView.builder(
      itemBuilder:(context, index){
        if(index<_todoItems.length){
          return _buildTodoItem(_todoItems[index]);
        }
      },
    );
  }



Widget _buildTodoItem(String todoText) {
    return new ListTile(
      title: new Text(todoText)
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Todo List')
      ),
      body: _buildTodoList(),
      floatingActionButton: new FloatingActionButton(
        onPressed: _addTodoItem,
        tooltip: 'Add task',
        child: new Icon(Icons.add)
      ),
    );
  }
}
