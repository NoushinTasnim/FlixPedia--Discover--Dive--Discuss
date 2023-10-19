import 'package:flix_pedia/model/auth_result.dart';

abstract class AuthenticationStrategy {
  Future<AuthResult> signUp();

  Future<AuthResult> signIn();

  Future<void> signOut();

  Future<void> deleteAccount();
}
