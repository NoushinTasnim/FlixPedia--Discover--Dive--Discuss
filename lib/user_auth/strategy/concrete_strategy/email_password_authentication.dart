import 'package:firebase_auth/firebase_auth.dart';
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
}