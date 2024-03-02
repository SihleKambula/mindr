import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final Icon icon;

  const CustomTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.obscureText,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(fontSize: 14),
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white)),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
            color: Color.fromARGB(255, 4, 73, 129),
          )),
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.grey),
          prefixIcon: icon,
          prefixIconColor: const Color.fromARGB(255, 4, 73, 129),
          fillColor: Colors.white,
          filled: true),
    );
  }
}
