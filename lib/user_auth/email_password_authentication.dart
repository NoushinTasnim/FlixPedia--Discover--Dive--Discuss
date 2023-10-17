import 'package:firebase_auth/firebase_auth.dart';
import 'auth_result.dart';
import 'authentication_strategy.dart';

class EmailPasswordAuthentication implements AuthenticationStrategy{

  final FirebaseAuth _auth = FirebaseAuth.instance;
  String _email = '';
  String _password = '';


  EmailPasswordAuthentication(this._email, this._password);

  String get email => _email;

  set email(String value) {
    _email = value;
  }

  String get password => _password;

  set password(String value) {
    _password = value;
  }

  @override
  Future<AuthResult> signUp(String email, String password) async {
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
      return AuthResult(user: userCredential.user, errorMessage: null);
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
}