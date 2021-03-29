import 'package:flutter/material.dart';

void main() =>runApp(ToDoApp());


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

  void _removeToDoItem(int index)
  {
    setState(()=>_todoItems.removeAt(index));
  }

  Widget _buildTodoItem(String todoText, int index) {
    return new ListTile(
      title: new Text(todoText),
      onTap:()=> _promptRemoveTodoItem(index)
    );
  }

  void _promptRemoveTodoItem(int index){
    showDialog(
      context: context,
      builder: (BuildContext){
        return new AlertDialog(
          title: new Text('Mark "${_todoItems[index]}" as done?'),
          actions: <Widget>[
            new FlatButton(
              child: new Text("Cancel"),
              onPressed: ()=> Navigator.of(context).pop()
            ),
            new FlatButton(
              child: new Text("MARK AS DONE"),
              onPressed: (){
                _removeToDoItem(index);
                Navigator.of(context).pop();
              }
            )
          ]
        );
      }
    );
  }

  void _addTodoItem(String task){
    setState((){
      int index=_todoItems.length;
      _todoItems.add(task);
    });
  }


  Widget _buildTodoList(){
    return new ListView.builder(
      itemBuilder:(context, index){
        if(index<_todoItems.length){
          return _buildTodoItem(_todoItems[index],index);
        }
      },
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
        onPressed: _pushAddToScreen,
        tooltip: 'Add task',
        child: new Icon(Icons.add)
      ),
    );
  }

  void _pushAddToScreen()
  {
    Navigator.of(context).push(

      new MaterialPageRoute(
        builder: (context){
          return new Scaffold(
            appBar:new AppBar(
              title: new Text("Add new task")
            ),
            body: new TextField(
              autofocus: true,
              onSubmitted: (val){
                _addTodoItem(val);
                Navigator.pop(context);
              },
              decoration: new InputDecoration(
                hintText: 'Enter name',
                contentPadding: const EdgeInsets.all(16.0)
              ),
            )
            );
        }
        ) 
      );
  }
}
