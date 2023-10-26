import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../observers/error_observer.dart';
import '../../auth_checker.dart';
import '../../auth_exception_handler.dart';
import '../../../model/auth_result.dart';
import '../authentication_strategy.dart';

class EmailPasswordAuthentication implements AuthenticationStrategy{

  final FirebaseAuth _auth = FirebaseAuth.instance;
  String _username = '';
  String _email = '';
  String _password = '';


  EmailPasswordAuthentication(this._username, this._email, this._password);

  String get username => _username;

  set username(String value) {
    _username = value;
  }

  String get email => _email;

  set email(String value) {
    _email = value;
  }

  String get password => _password;

  set password(String value) {
    _password = value;
  }

  @override
  Future<AuthResult> signUp() async {
    if(username.isEmpty)
    {
      return AuthResult(user: null, errorMessage: 'Please Enter Name');
    }
    if(email.isEmpty)
    {
      return AuthResult(user: null, errorMessage: 'Please Enter Email');
    }
    if(password.isEmpty)
    {
      return AuthResult(user: null, errorMessage: 'Please Enter Password');
    }
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = userCredential.user;
      await user?.updateDisplayName(username);
      await user?.reload();

      User? latestUser = FirebaseAuth.instance.currentUser;
      print('${latestUser?.displayName}');
      print(userCredential.user);
      // saveUser(email, password);
      return AuthResult(user: latestUser, errorMessage: null);
    } on FirebaseAuthException catch (e) {
        return handleAuthException(e);
    } catch (e) {
      return AuthResult(user: null, errorMessage: 'Error during sign-up: $e');
    }
  }

  @override
  Future<AuthResult> signIn() async {
    if(email.isEmpty)
    {
      return AuthResult(user: null, errorMessage: 'Please Enter Email');
    }
    if(password.isEmpty)
    {
      return AuthResult(user: null, errorMessage: 'Please Enter Password');
    }
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      saveUser(email, password);
      return AuthResult(user: userCredential.user, errorMessage: null);
    } on FirebaseAuthException catch (e) {
        return handleAuthException(e);
    } catch (e) {
      return AuthResult(user: null, errorMessage: 'Error during sign-in: $e');
    }
  }

  @override
  Future<void> signOut() async {
    _auth.signOut();
  }

  @override
  Future<void> deleteAccount() async {
    await _auth.currentUser!.delete();
  }

  @override
  Future<void> saveUser(String email, String password) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString('email', email);
    prefs.setString('password', password);
    prefs.setString('authenticationStrategy', 'emailPass');
  }

  @override
  Future<void> loadUser(SharedPreferences prefs, BuildContext context)  async {
    String email = prefs.getString('email')!;
    String password = prefs.getString('password')!;

    UserCredential userCredential = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    User user = userCredential.user!;
    print(user);
    // saveData(user, context, EmailPasswordAuthentication(user.displayName!=null ? user.displayName! : 'aa', email, password));
  }
}