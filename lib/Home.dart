import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> _task = [];
  TextEditingController _taskController = TextEditingController();

  _addTask() {
    if (_taskController.text.isNotEmpty) {
      setState(() {
        _task.add(_taskController.text);
        _taskController.clear();
      });
    }
  }

  _removeTask(int index) {
    setState(() {
      _task.removeAt(index);
    });
  }

  _removeAll() {
    setState(() {
      _task.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text(
          "Simple To-do List",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _taskController,
              decoration: InputDecoration(
                hintText: "Enter your task",
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  onPressed: _addTask,
                  icon: Icon(Icons.add),
                ),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _task.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(_task[index]),
                      trailing: IconButton(
                        onPressed: () => _removeTask(index),
                        icon: Icon(Icons.delete, color: Colors.red),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _removeAll,
        child: Icon(Icons.delete_forever),
      ),
    );
  }
}
