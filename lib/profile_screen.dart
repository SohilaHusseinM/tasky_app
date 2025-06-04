import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final TextEditingController userNameController = TextEditingController();
  final TextEditingController motivationQuoteController = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "User Details",
          style: Theme.of(context).textTheme.displaySmall?.copyWith(fontSize: 20),
        ),
        backgroundColor: Color(0xFF181818),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child:Text('plapla'),
        ),
      ),
    );
  }
}
