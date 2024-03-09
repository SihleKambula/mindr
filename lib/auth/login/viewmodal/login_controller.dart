import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginAuth extends ChangeNotifier {
  bool _loading = false;
  UserCredential? _user;
  String? _error;

  // getters to get the state values
  bool get loading => _loading;
  UserCredential? get user => _user;
  String? get error => _error;

  // functions to change the status
  setLoading(bool loading) async {
    _loading = loading;
    notifyListeners();
  }

  setUser(UserCredential loggedInUser) {
    _user = loggedInUser;
  }

  setError(String error) {
    _error = error;
  }

  loginWithEmailAndPassword(String email, String password) async {
    setLoading(true);
    try {
      final userCred = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      setUser(userCred);
      print(userCred);
      setLoading(false);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        setError('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        setError('Wrong password provided for that user.');
      }
      setLoading(false);
    }
  }

  //continue with googl
  Future<void> signInWithGoogle() async {
    setLoading(true);
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      final userCred =
          await FirebaseAuth.instance.signInWithCredential(credential);
      setUser(userCred);
      setLoading(false);
    } catch (e) {
      print(e);
      setLoading(false);
    }
  }
}
