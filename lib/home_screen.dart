import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tasky/add_task_screen.dart';
import 'package:tasky/core/model/task_model.dart';
import 'package:tasky/todo_screen.dart';

import 'core/component/custom_task_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
    //build func can't be async because it's override come from the state
    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //         builder: (BuildContext context) {
      //           return AddTaskScreen();
      //         },
      //       ),
      //     );
      //   },
      // ),

      body: SafeArea(
        child: Container(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 8),
              Row(
                children: [
                  CircleAvatar(
                    radius: 21, //radius = width/2 == height/2 (if width==height)
                    backgroundColor: Color(0xFFEDF7FA),
                    // backgroundImage: AssetImage('assets/images/profile.png'),
                    child:  SvgPicture.asset('assets/images/profile.svg'),
                  ),
                  // SizedBox(height: 38),
                  SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Good Evening ,${username} ",
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                      Text(
                        "One task at a time.One step\n closer.",
                        //  TextStyle(fontFamily: 'Poppins')
                        style: Theme.of(
                          context,
                        ).textTheme.displayLarge?.copyWith(fontSize: 14),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 24),
              Text(
                "Yuhuu ,Your work Is ",
                style: Theme.of(context).textTheme.displayMedium?.copyWith(fontSize: 32),
              ),
              Row(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "almost done ! ",
                    style: Theme.of(
                      context,
                    ).textTheme.displayMedium?.copyWith(fontSize: 32),
                  ),
                  SizedBox(height: 8),
                  SvgPicture.asset('assets/images/waving_hand.svg', width: 32, height: 32)
                ],
              ),
              SizedBox(height: 296),
              Text(
                "My Tasks",
                style: Theme.of(context).textTheme.displaySmall?.copyWith(fontSize: 20),
              ),
              SizedBox(height: 16),
              //add tasks here
              CustomTaskContainer(taskModel:taskModel),
              SizedBox(height: 30),

              ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return AddTaskScreen();
                      },
                    ),
                  );
                },
                label: Text('Add New Task'),
                icon: Icon(Icons.add),
              ),

            ],
          ),
        ),
      )
      ),
    );
  }
}
