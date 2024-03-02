import 'package:flutter/material.dart';

class GoogleLogin extends StatelessWidget {
  const GoogleLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('Siging up');
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(8)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/icons/google.png',
              height: 30,
            ),
            const SizedBox(
              width: 10,
            ),
            const Text(
              'Continue with Google',
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
