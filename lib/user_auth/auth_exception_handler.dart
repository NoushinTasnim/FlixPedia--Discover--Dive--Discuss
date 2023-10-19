import 'package:firebase_auth/firebase_auth.dart';

import '../model/auth_result.dart';

AuthResult handleAuthException(FirebaseAuthException e) {
  String errorMessage;
  if (e.code.trim() == 'weak-password') {
    errorMessage = 'The Password should be at least 6 characters.';
  } else if (e.code.trim() == 'email-already-in-use') {
    errorMessage = 'The account already exists for this email.';
  } else if (e.code.trim() == 'user-not-found') {
    errorMessage = 'No user found for that email.';
  } else if (e.code.trim() == 'wrong-password') {
    errorMessage = 'Wrong password provided for that user.';
  } else {
    errorMessage = 'Invalid Credentials.';
  }

  return AuthResult(user: null, errorMessage: errorMessage);
}