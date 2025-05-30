import 'package:flutter/material.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: Container(
          padding: const EdgeInsets.all(16.0),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 8,),
              Row(
                children: [
                  SizedBox(width: 56,),
                  Text("New Task", style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    fontSize: 20,
                  )),
                ],
              ),
              SizedBox(height: 18,),
              Text("Task Name", style: Theme.of(context).textTheme.displaySmall,),
              SizedBox(height: 8,),
              TextField(
                style: TextStyle(color: Colors.white),
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  fillColor: Color(0xFF282828),
                  filled: true,
                  hintText: 'Finish UI design for login screen',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0), // Rounded corners
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Text("Task Description", style: Theme.of(context).textTheme.displaySmall,),
              TextField(
                style: TextStyle(color: Colors.white),
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  fillColor: Color(0xFF282828),
                  filled: true,
                  hintText: 'Finish onboarding UI and hand off to devs by Thursday.',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0), // Rounded corners
                  ),
                ),

              ),
              SizedBox(height: 149,),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return AddTaskScreen();
                        },
                      ),
                    );
                  }, child: Text('+  Add Task',)),
            ]
          ),
        )
    );
  }
}
