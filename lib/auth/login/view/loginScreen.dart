// ignore: file_names
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mindr/auth/login/viewmodal/login_controller.dart';
import 'package:provider/provider.dart';
import 'package:mindr/auth/components/auth_button.dart';

import 'package:mindr/auth/components/custom_text_field.dart';
import 'package:mindr/auth/components/google_login.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  void signupUser() {
    if (passwordController.text.isNotEmpty && emailController.text.isNotEmpty) {
      Provider.of<LoginAuth>(context, listen: false).loginWithEmailAndPassword(
          emailController.text, passwordController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Icon(
                    Icons.lock,
                    color: Color.fromARGB(255, 4, 73, 129),
                    size: 80,
                  ),
                  Text(
                    'Welcome back',
                    style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomTextField(
                    controller: emailController,
                    hintText: 'Email',
                    obscureText: false,
                    icon: const Icon(Icons.alternate_email_rounded),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                    controller: passwordController,
                    hintText: 'password',
                    obscureText: true,
                    icon: const Icon(Icons.lock_outline_rounded),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text(
                        "Don't have an account?",
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      InkWell(
                        child: const Text(
                          'Sign up',
                          style: TextStyle(
                              fontSize: 12,
                              color: Color.fromARGB(255, 4, 73, 129)),
                        ),
                        onTap: () {
                          context.go('/signup');
                        },
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  AuthButton(
                    buttonName: 'Login',
                    authFunction: signupUser,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      )),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.0),
                        child: Text(
                          'or',
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ),
                      Expanded(
                          child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      )),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const GoogleLogin()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
