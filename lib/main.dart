import 'package:flutter/material.dart';
import 'package:tasky/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

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
            color: Color(0xFFFFFCFC),
            fontWeight: FontWeight.w500,
            fontSize: 32
          )
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF15B86C),
            foregroundColor: Color(0xFFFFFCFC),
            //MediaQuery.of(context).size.width (responsive width)
            fixedSize: Size(MediaQuery.of(context).size.width, 40),
            textStyle: Theme.of(
              context,
            ).textTheme.displaySmall?.copyWith(fontSize: 14, fontWeight: FontWeight.w500),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(100)),

            ),
          ),
        ),

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  //BuildContext : specify Your place int the tree
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 42),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/logo.png'),

                //svg not working !!!!!!!!!!!!!!!!!!!!!
                SizedBox(width: 16),
                Text('Tasky', style: Theme.of(context).textTheme.displayMedium),
              ],
            ),
            SizedBox(height: 108),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Welcome To Tasky",
                  style: Theme.of(
                    context,
                  ).textTheme.displayMedium?.copyWith(fontSize: 26),
                ),
                SizedBox(width: 8),
                Image.asset('assets/images/waving_hand.png', width: 28, height: 28),
              ],
            ),
            SizedBox(height: 8),
            Text(
              "Your productivity journey starts here.",
              style: Theme.of(context).textTheme.displaySmall,
            ),

            SizedBox(height: 24),
            Image.asset('assets/images/pana.png', width: 215, height: 204.39450073242188),
            SizedBox(height: 28),

            Text(
              "Full Name",
              style: Theme.of(context).textTheme.displaySmall,
              textAlign: TextAlign.left,
            ),

            SizedBox(height: 8),
            TextField(
              style: TextStyle(color: Colors.white),
              cursorColor: Colors.white,
              decoration: InputDecoration(
                  fillColor: Color(0xFF282828),
                  filled: true,
                hintText: 'e.g. Sarah Khalid',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.0), // Rounded corners
                ),
              ),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return HomeScreen();
                    },
                  ),
                );
              },
              child: Text('Let’s Get Started'),
            ),
          ],
        ),
      ),
    );
  }
}
