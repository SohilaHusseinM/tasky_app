import 'package:flutter/material.dart';
import 'package:tasky/add_task_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
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
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 8),
            Row(
              children: [
                CircleAvatar(
                  radius: 21, //radius = width/2 == height/2 (if width==height)
                  backgroundColor: Color(0xFFEDF7FA),
                  backgroundImage: AssetImage('assets/images/profile.png'),
                ),
                // SizedBox(height: 38),
                SizedBox(width: 8),

                Column(
                  children: [
                    Text(
                      "Good Evening ,Sohila ",
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    Text(
                      "One task at a time.One step\n closer.",
                      //  TextStyle(fontFamily: 'Poppins')
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        color: Color(0xFFC6C6C6),
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 24),
            Text("Yuhuu ,Your work Is ", style: Theme.of(context).textTheme.displayLarge),
            Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("almost done ! ", style: Theme.of(context).textTheme.displayLarge),
                SizedBox(height: 8),
                Image.asset('assets/images/waving_hand.png', width: 32, height: 32),
              ],
            ),
            SizedBox(height: 286),
            Text("My Tasks", style: Theme.of(context).textTheme.displaySmall?.copyWith(
              fontSize: 20,
            )),
            SizedBox(height: 100),

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
                }, child: Text('+  Add New Task')),
          ],
        ),
      ),
    );
  }
}
