import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tasky/core/component/custom_text_form_field.dart';
import 'package:tasky/core/model/task_model.dart';
import 'package:tasky/home_screen.dart';
import 'package:tasky/main_screen.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  bool isHighPriority = true;
  final TextEditingController taskNameController = TextEditingController();
  final TextEditingController taskDescController = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: _key,
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back),
                        color: Color(0xFFFFFCFC),
                        iconSize: 24,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      SizedBox(width: 8),
                      Text(
                        "New Task",
                        style: Theme.of(
                          context,
                        ).textTheme.displaySmall?.copyWith(fontSize: 20),
                      ),
                    ],
                  ),
                  SizedBox(height: 18),

                  CustomTextFormField(
                    title: 'Task Name',
                    hintText: 'Finish UI design for login screen',
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter Task Name';
                      }
                      return null;
                    },
                    controller: taskNameController,
                  ),
                  SizedBox(height: 20),

                  CustomTextFormField(
                    title: 'Task Description',
                    hintText: 'Finish onboarding UI and hand off to devs by Thursday.',
                    maxLines: 5,
                    controller: taskDescController,
                  ),

                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        " High Priority",
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                      Switch(
                        value: isHighPriority,
                        onChanged: (bool value) {
                          setState(() {
                            //refresh state --> refresh nearest build method (rebuild)
                            isHighPriority = value;
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 149),
                  ElevatedButton.icon(
                    onPressed: () async {
                      if (_key.currentState?.validate() ?? false) {
                        final SharedPreferences prefs =
                            await SharedPreferences.getInstance();

                        final String? list = prefs.getString(
                          'tasks',
                        ); //get all previous tasks

                        List<dynamic> listTasks = [];

                        if (list != null) {
                          listTasks = jsonDecode(list); //list to list of dynamic
                        }

                        TaskModel taskModel = TaskModel(
                          id: listTasks.length + 1,
                          title: taskNameController.text,
                          description: taskDescController.text,
                          isHighPriority: isHighPriority,
                        );

                        listTasks.add(taskModel.toMap());

                        String value = jsonEncode(listTasks);
                        print(taskModel.toMap());

                        await prefs.setString('tasks', value);

                        taskNameController.clear();
                        taskDescController.clear();


                        // Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) {
                              return MainScreen();
                            },
                          ),
                        );
                      }
                    },
                    label: Text(' Add Task'),
                    icon: Icon(Icons.add),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
