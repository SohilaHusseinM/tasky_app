import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tasky/core/component/custom_text_form_field.dart';
import 'package:tasky/main_screen.dart';
import 'home_screen.dart';

class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({super.key});

  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final TextEditingController controller =
      TextEditingController(); //reference for all textform field



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // resizeToAvoidBottomInset: true,
      body: SafeArea(

        child: SingleChildScrollView(
          reverse: true,
          child: Form(
          key: _key,
          // padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/images/logo.svg'),
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
                  SvgPicture.asset(
                    'assets/images/waving_hand.svg',
                    width: 28,
                    height: 28,
                  ),
                ],
              ),
              SizedBox(height: 8),
              Text(
                "Your productivity journey starts here.",
                style: Theme.of(context).textTheme.displaySmall,
              ),

              SizedBox(height: 24),
              SvgPicture.asset(
                'assets/images/pana.svg',
                width: 215,
                height: 204.39450073242188,
              ),
              SizedBox(height: 28),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16), // if left==right
                // padding: const EdgeInsets.only(left: 16,right: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextFormField(
                      title: 'Full name',
                      hintText: 'e.g. Sarah Khalid',
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                      controller: controller,
                    ),

                    SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: () async {
                        if (_key.currentState?.validate() ?? false) {
                          final SharedPreferences prefs =
                          await SharedPreferences.getInstance();

                          await prefs.setString('username', controller.text);
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) {
                                return MainScreen();
                              },
                            ),
                          );
                        }
                      },
                      child: Text('Let’s Get Started'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      )
    );
  }
}
