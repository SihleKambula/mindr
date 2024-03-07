import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  final String buttonName;
  final dynamic authFunction;
  const AuthButton(
      {super.key, required this.buttonName, required this.authFunction});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        authFunction();
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 4, 73, 129),
            borderRadius: BorderRadius.circular(8)),
        child: Center(
          child: Text(
            buttonName,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
