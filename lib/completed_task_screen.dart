import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tasky/core/component/custom_task_container.dart';

import 'core/model/task_model.dart';

class CompletedTaskScreen extends StatefulWidget {
  const CompletedTaskScreen({super.key});

  @override
  State<CompletedTaskScreen> createState() => _CompletedTaskScreenState();
}

class _CompletedTaskScreenState extends State<CompletedTaskScreen> {
  List<TaskModel> taskModel = [];
  String? username = '';

  @override
  void initState() {
    ///we can write async with initState but when run it -->error thrown (can't make func async without building the page first)
    super.initState();
    _getData();
  }

  void _getData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    //get tasks
    String? tasks = prefs.getString('tasks');
    if (tasks != null) {
      setState(() {
        this.username = prefs.getString('username');
        final taskDecode = jsonDecode(tasks) as List<dynamic>;
        taskModel = taskDecode.map((e) => TaskModel.fromMap(e)).toList();
        print(username);
        print(taskModel.map((e) => print(e.toMap())));
      });
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Completed Tasks",
          style: Theme.of(context).textTheme.displaySmall?.copyWith(fontSize: 20),
        ),
        backgroundColor: Color(0xFF181818),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: CustomTaskContainer(taskModel: taskModel),
        ),
      ),
    );
  }
}
