import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mindr/auth/signup/viewmodal/signup_controller.dart';
import 'package:mindr/components/loading.dart';
import 'package:provider/provider.dart';
import 'package:mindr/auth/components/auth_button.dart';

import 'package:mindr/auth/components/custom_text_field.dart';
import 'package:mindr/auth/components/google_login.dart';

class SignUpScreen extends StatefulWidget {
  final dynamic showLogin;
  const SignUpScreen({super.key, required this.showLogin});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
    if (passwordController.text.isNotEmpty &&
        passwordController.text == confirmPasswordController.text) {
      Provider.of<SignUpAuth>(context, listen: false)
          .signUpWithEmailAndPassword(
              emailController.text, passwordController.text);
    }
    //TODO: return rejection to user
    print('passwords do not match');
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SignUpAuth>(
      builder: (context, signUpProvider, child) {
        return signUpProvider.loading
            ? const Loading()
            : Scaffold(
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
                              'Welcome to Mindr',
                              style: TextStyle(
                                  fontSize: 16, color: Colors.grey[700]),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            CustomTextField(
                              controller: emailController,
                              hintText: 'Email',
                              obscureText: false,
                              icon: const Icon(Iconsax.sms),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            CustomTextField(
                              controller: passwordController,
                              hintText: 'password',
                              obscureText: true,
                              icon: const Icon(Iconsax.lock),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            CustomTextField(
                              controller: confirmPasswordController,
                              hintText: 'confirm password',
                              obscureText: true,
                              icon: const Icon(Iconsax.password_check),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                const Text(
                                  'Already have an account?',
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.grey),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                InkWell(
                                  child: const Text(
                                    'Login',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Color.fromARGB(255, 4, 73, 129)),
                                  ),
                                  onTap: () {
                                    widget.showLogin();
                                  },
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            AuthButton(
                              buttonName: 'Sign up',
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
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 5.0),
                                  child: Text(
                                    'or',
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.grey),
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
                            GoogleLogin(
                                continueWithGoogle: Provider.of<SignUpAuth>(
                                        context,
                                        listen: false)
                                    .signInWithGoogle)
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
      },
    );
  }
}
