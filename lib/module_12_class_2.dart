import 'package:flutter/material.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  List<Map<String, dynamic>> tasks = [];
  bool showActiveTask = true;

  void _showTaskDialog({int? index}) {

    TextEditingController _taskController = TextEditingController(
      text: index != null ? tasks[index]['task'] : '',
    );
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(index != null ? 'Edit Task' : 'Add Task'),
              content: TextField(
                controller: _taskController,
                decoration: InputDecoration(hintText: 'Enter Task'),
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Cancle')),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(shape: StadiumBorder()),
                    onPressed: (){
                      if(_taskController.text.trim().isNotEmpty){
                        if(index == null){
                          _addTask(_taskController.text);
                        }else{
                          _editTask(index,_taskController.text);
                        }
                      }
                    },
                    child: Text('Save'))
              ],
            ));
  }

  void _addTask(String task) {
    setState(() {
      tasks.add({"task": task, "completed": false});
    });
    Navigator.pop(context);
  }

  void _toggleTaskStatus(int index) {
    setState(() {
      tasks[index]['completed'] = !tasks[index]['completed'];
    });
  }

  void _deleteTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });
  }

  void _editTask(int index,String updateTask){
    setState(() {
      tasks[index]['task'] = updateTask;
    });
    Navigator.pop(context);
  }

  int get activeCount => tasks.where((task) => !task['completed']).length;
  int get completedCount => tasks.where((task) => task['completed']).length;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        title: Text('Todo app'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(color: Colors.black12, blurRadius: 4)
                      ]),
                  padding: EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Text("Active",
                          style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.w500,
                              color: Colors.black)),
                      Text(activeCount.toString(),
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(color: Colors.black12, blurRadius: 4)
                      ]),
                  padding: EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Text("Completed",
                          style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.w500,
                              color: Colors.black)),
                      Text(completedCount.toString(),
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  print(tasks[index]['task']);
                  return Dismissible(
                    key: Key(UniqueKey().toString()),
                    background: Container(
                      color: Colors.green,
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(left: 20),
                      child: Icon(
                        Icons.check,
                        color: Colors.white,
                      ),
                    ),
                    secondaryBackground: Container(
                      color: Colors.red,
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.only(right: 20),
                      child: Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
                    ),
                    onDismissed: (direction) {
                      if (direction == DismissDirection.startToEnd) {
                        _toggleTaskStatus(index);
                      } else {
                        _deleteTask(index);
                      }
                    },
                    child: Card(
                      child: ListTile(
                        title: Text(
                          tasks[index]['task'],
                          style: TextStyle(
                            fontSize: 16,
                            decoration: tasks[index]['completed']
                                ? TextDecoration.lineThrough
                                : null,
                          ),
                        ),
                        leading: Checkbox(
                            shape: CircleBorder(),
                            value: tasks[index]['completed'],
                            onChanged: (value) => _toggleTaskStatus(index)),
                        trailing: IconButton(onPressed: ()=> _showTaskDialog(index: index), icon: Icon(Icons.edit)),
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showTaskDialog(),
        child: Icon(Icons.add),
      ),
    );
  }
}
