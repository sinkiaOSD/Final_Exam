import 'dart:math';

import 'package:flutter/material.dart';

import 'models/task.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  _TodoScreenState createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  List<Task> _tasks = [];
  List<Task> _filteredTasks = [];
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_filterTasks);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _addTask(String contactName, String phoneNumber) {
    setState(() {
      String id = Random().nextInt(10000).toString();
      _tasks.add(
          Task(id: id, contactName: contactName, phoneNumber: phoneNumber));
      _filteredTasks = List.from(_tasks);
    });
  }

  void _editTask(String id, String newContactName, String newPhoneNumber) {
    setState(() {
      Task task = _tasks.firstWhere((task) => task.id == id);
      task.contactName = newContactName;
      task.phoneNumber = newPhoneNumber;
      _filteredTasks = List.from(_tasks);
    });
  }

  void _deleteTask(String id) {
    setState(() {
      _tasks.removeWhere((task) => task.id == id);
      _filteredTasks = List.from(_tasks);
    });
  }

  void _filterTasks() {
    String query = _searchController.text.toLowerCase();
    setState(() {
      _filteredTasks = _tasks.where((task) {
        return task.contactName.toLowerCase().contains(query) ||
            task.phoneNumber.contains(query);
      }).toList();
    });
  }

  void _showTaskDialog({Task? task}) {
    final contactNameController =
        TextEditingController(text: task?.contactName ?? '');
    final phoneNumberController =
        TextEditingController(text: task?.phoneNumber ?? '');

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(task == null ? 'Add Task' : 'Edit Task'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: contactNameController,
                decoration: InputDecoration(labelText: 'Contact Name'),
              ),
              TextField(
                controller: phoneNumberController,
                decoration: InputDecoration(labelText: 'Phone Number'),
                keyboardType: TextInputType.phone,
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                if (task == null) {
                  _addTask(
                      contactNameController.text, phoneNumberController.text);
                } else {
                  _editTask(task.id, contactNameController.text,
                      phoneNumberController.text);
                }
                Navigator.of(context).pop();
              },
              child: Text(task == null ? 'Add' : 'Save'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To-Do List'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Search',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredTasks.length,
              itemBuilder: (context, index) {
                Task task = _filteredTasks[index];
                return ListTile(
                  title: Text(task.contactName),
                  subtitle: Text(task.phoneNumber),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () => _showTaskDialog(task: task),
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () => _deleteTask(task.id),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showTaskDialog(),
        child: Icon(Icons.add),
        backgroundColor: Colors.deepPurple,
      ),
    );
  }
}
