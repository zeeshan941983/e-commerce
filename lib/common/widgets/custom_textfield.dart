import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final int maxLines;
  const CustomTextfield({
    super.key,
    required this.controller,
    this.maxLines = 1,
    required this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xff4A44AB))),
        border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black38)),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black38)),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Enter your $hint';
        }
        return null;
      },
      maxLines: maxLines,
    );
  }
}
