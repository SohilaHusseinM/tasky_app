import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tasky/main_screen.dart';
import 'package:tasky/welcome_screen.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  final SharedPreferences prefs = await SharedPreferences.getInstance();

  // prefs.clear();

  String? username = prefs.getString('username');
  // print(username);

  // String? task = prefs.getString('tasks');
  // if (task != null) {
  //   List<dynamic> value = jsonDecode(task);
  //
  //   print("new value");
  //   print(value);
  // }
  // TaskModel model=TaskModel.fromMap(value);


  runApp(MyApp(username:username));
}

class MyApp extends StatelessWidget {
  MyApp({super.key,required username});

  String? username;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: TextStyle(color: Color(0xFF6D6D6D)),
          fillColor: Color(0xFF282828),
          filled: true,

          labelStyle: TextStyle(color: Colors.white),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0), // Rounded corners
            borderSide: BorderSide.none, //remove focus
          ),
        ),
        switchTheme: SwitchThemeData(
          trackColor: WidgetStateProperty.resolveWith((state) {
            if (state.contains(WidgetState.selected)) {
              return Color(0xFF15B86C);
            }
            return Color(0xFFFFFCFC);
          }),
          trackOutlineColor: WidgetStateProperty.resolveWith((state) {
            //border color
            if (state.contains(WidgetState.selected)) {
              return Colors.transparent;
            }
            return Color(0xFF9E9E9E);
          }),
          trackOutlineWidth: WidgetStateProperty.resolveWith((state) {
            //broder width
            if (state.contains(WidgetState.selected)) {
              return 0;
            }
            return 2;
          }),
          thumbColor: WidgetStateProperty.resolveWith((state) {
            //circle in switch
            if (state.contains(WidgetState.selected)) {
              return Color(0xFFFFFCFC);
            }
            return Color(0xFF9E9E9E);
          }),
        ),
        scaffoldBackgroundColor: Color(0xFF181818),
        textTheme: TextTheme(
          //to not put it hard coded
          displayMedium: TextStyle(
            color: Color(0xFFFFFCFC),
            fontWeight: FontWeight.w400,
            fontSize: 28,
          ),
          displaySmall: TextStyle(
            color: Color(0xFFFFFCFC),
            fontWeight: FontWeight.w400,
            fontSize: 16,
          ),
          displayLarge: TextStyle(
            color: Color(0xFFC6C6C6),
            fontWeight: FontWeight.w500,
            fontSize: 32,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF15B86C),
            foregroundColor: Color(0xFFFFFCFC),
            //MediaQuery.of(context).size.width (responsive width)
            fixedSize: Size(MediaQuery.of(context).size.width, 40),
            textStyle: TextStyle(
              color: Color(0xFFFFFCFC),
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(100)),
            ),
          ),
        ),

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),

        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Color(0xFF181818),
          type: BottomNavigationBarType.fixed,
          unselectedItemColor:Color(0xFFC6C6C6),
          selectedItemColor: Color(0xFF15B86C),

        )
      ),
      home: username==null?WelcomeScreen():MainScreen(),
    );
  }
}
