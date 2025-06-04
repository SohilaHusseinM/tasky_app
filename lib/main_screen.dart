import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tasky/add_task_screen.dart';
import 'package:tasky/completed_task_screen.dart';
import 'package:tasky/home_screen.dart';
import 'package:tasky/profile_screen.dart';
import 'package:tasky/todo_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Widget> screens = [
    HomeScreen(),
    TodoScreen(),
    CompletedTaskScreen(),
    ProfileScreen(),
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int? index) {
          if (index != null) {
            setState(() {
              _currentIndex = index;
            });
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/images/home.svg'),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/images/todo.svg'),
            label: 'To Do',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/images/completed.svg'),
            label: 'Completed',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/images/profile.svg'),
            label: 'Profile',
          ),
        ],
      ),
      body: screens[_currentIndex],
    );
  }
}
