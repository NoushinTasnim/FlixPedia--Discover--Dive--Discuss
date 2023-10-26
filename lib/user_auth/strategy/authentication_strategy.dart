import 'package:flix_pedia/model/auth_result.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthenticationStrategy {
  Future<AuthResult> signUp();

  Future<AuthResult> signIn();

  Future<void> signOut();

  Future<void> deleteAccount();

  Future<void> saveUser(String email, String password);

  Future<void> loadUser(SharedPreferences prefs, BuildContext context);
}
