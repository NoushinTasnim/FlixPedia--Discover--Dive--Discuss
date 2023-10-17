import 'package:flix_pedia/user_auth/auth_result.dart';

abstract class AuthenticationStrategy {
  Future<AuthResult> signUp(String email, String password);

  Future<AuthResult> signIn();

  Future<void> signOut();
}
