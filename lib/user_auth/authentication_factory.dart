import 'authentication_strategy.dart';
import 'email_password_authentication.dart';
import 'google_authentication.dart';

class AuthenticationStrategyFactory {
  AuthenticationStrategy createEmailPasswordAuthenticationStrategy(String username, String email, String password) {
    return EmailPasswordAuthentication(username, email,password);
  }

  AuthenticationStrategy createGoogleSignInAuthenticationStrategy() {
    return GoogleAuthentication();
  }
}
