import 'package:flutter/material.dart';

class AuthTextField extends StatelessWidget {
  const AuthTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.icons,
    required this.fieldName,
  });

  final TextEditingController controller;
  final String hintText;
  final Icon icons;
  final String fieldName;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        prefixIcon: icons,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "$fieldName is required";
        }
        if (value.length < 3) {
          return "Name must be at least 3 characters";
        }
        return null;
      },
    );
  }
}
