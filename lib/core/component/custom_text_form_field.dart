import 'package:flutter/material.dart';
class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key,
    required this.title,required this.hintText,
    this.maxLines,
    required this.controller,
    this.validator
  });

  final String title;
  final String hintText;
  final int? maxLines;
  final Function(String?)? validator;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Text(title, style: Theme.of(context).textTheme.displaySmall),

        SizedBox(height: 8),
        TextFormField(
           controller: controller,
          style: TextStyle(color: Colors.white),
          cursorColor: Colors.white,
          maxLines: maxLines,
          decoration: InputDecoration(hintText: hintText),
          validator: (String? value) {
            if(validator!=null) return validator!(value);
            return null;
          },
          // onChanged: (value){ //any change in textfield // not best solution-->any change > assign new value
          //   print(value);
          //   name=value;
          // },
        ),
      ],
    );
  }
}
