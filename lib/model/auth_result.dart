import 'package:firebase_auth/firebase_auth.dart';

class AuthResult {
    User? user;
    String? errorMessage;

    AuthResult({this.user, this.errorMessage});
}