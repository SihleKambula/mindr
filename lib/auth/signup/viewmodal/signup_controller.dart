import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpAuth extends ChangeNotifier {
  //state variables
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

  signUpWithEmailAndPassword(String email, String password) async {
    setLoading(true);
    try {
      final userCred = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      setUser(userCred);
      print(userCred);
      setLoading(false);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        setError('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        setError('The account already exists for that email.');
      }
    } catch (e) {
      setError('An unknown error occurred');
    }
    setLoading(false);
  }
}
