import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'auth_result.dart';
import 'authentication_strategy.dart';

class GoogleAuthentication implements AuthenticationStrategy {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  @override
  Future<AuthResult> signIn() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      print('google user $googleUser');
      if (googleUser == null)
        return AuthResult(user: null, errorMessage: "No User");

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      print('asas : $googleAuth');
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential authResult = await _auth.signInWithCredential(credential);
      return AuthResult(user: authResult.user, errorMessage: null);
    } catch (e) {
      return AuthResult(user: null, errorMessage: "Error signing in with Google: $e");
    }
  }

  @override
  Future<AuthResult> signUp(String email, String password) {
    // TODO: implement signUp
    throw UnimplementedError();
  }

  @override
  Future<void> signOut() async {
    await _auth.signOut();
    await _googleSignIn.signOut();
  }
}