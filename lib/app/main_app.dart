import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Main extends StatelessWidget {
  const Main({super.key});

  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            logout();
            print('Out');
          },
          child: Text('Log out'),
        ),
      ),
    );
  }
}
