import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    required this.controller,
    required this.validator,
  }) : super(key: key);
  final TextEditingController controller;
  final Function validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (String? value) => validator(value),
      decoration: const InputDecoration(
        border: UnderlineInputBorder(
          borderSide: BorderSide(style: BorderStyle.none),
        ),
      ),
    );
  }
}
