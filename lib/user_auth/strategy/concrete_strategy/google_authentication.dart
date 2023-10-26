import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../model/auth_result.dart';
import '../../../observers/error_observer.dart';
import '../../auth_checker.dart';
import '../authentication_strategy.dart';

class GoogleAuthentication implements AuthenticationStrategy {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  @override
  Future<AuthResult> signIn() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        return AuthResult(user: null, errorMessage: "No User");
      }

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      print(googleAuth.accessToken);
      print(googleAuth.idToken);

      final UserCredential authResult = await _auth.signInWithCredential(credential);
      print(authResult);
      String accessToken = googleAuth.accessToken!;
      print(accessToken);
      // String idToken = googleAuth.idToken!;
      // if(idToken.isEmpty){
      //   idToken = 'a';
      // }
      // print('asas' + idToken);
      await saveUser(accessToken, 'idToken');

      return AuthResult(user: authResult.user, errorMessage: null);
    } catch (e) {
      return AuthResult(user: null, errorMessage: "Error signing in with Google: $e");
    }
  }

  @override
  Future<AuthResult> signUp() {
    return signIn();
  }

  @override
  Future<void> signOut() async {
    await _auth.signOut();
    await _googleSignIn.signOut();
  }

  @override
  Future<void> deleteAccount() async {
    await _auth.currentUser!.delete();
  }

  @override
  Future<void> saveUser(String accessToken, String idToken) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString('accessToken', accessToken);

    print(prefs.getString('accessToken'));
    prefs.setString('idToken', idToken);
    prefs.setString('authenticationStrategy', 'google');

    print(prefs.getString('authenticationStrategy'));
  }

  @override
  Future<void> loadUser(SharedPreferences prefs, BuildContext context) async {
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: prefs.getString('accessToken'),
      idToken: prefs.getString('idToken'),
    );

    final UserCredential authResult = await _auth.signInWithCredential(credential);
  }
}