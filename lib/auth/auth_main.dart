import 'package:flutter/material.dart';
import 'package:mindr/auth/login/view/loginScreen.dart';
import 'package:mindr/auth/signup/view/signup_screen.dart';

class AuthMainScreen extends StatefulWidget {
  const AuthMainScreen({super.key});

  @override
  State<AuthMainScreen> createState() => _AuthMainScreenState();
}

class _AuthMainScreenState extends State<AuthMainScreen> {
  bool showSign = true;
  bool showLogin = false;

  void showSignUpScreen() {
    setState(() {
      showSign = true;
      showLogin = false;
    });
  }

  void showLoginScreen() {
    setState(() {
      showSign = false;
      showLogin = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    switch (showSign) {
      case true:
        return SignUpScreen(showLogin: showLoginScreen);
      default:
        return LoginScreen(
          showSignUp: showSignUpScreen,
        );
    }
  }
}
