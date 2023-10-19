import 'strategy/authentication_strategy.dart';
import 'strategy/concrete_strategy/email_password_authentication.dart';
import 'strategy/concrete_strategy/google_authentication.dart';

class AuthenticationStrategyFactory {
  AuthenticationStrategy createEmailPasswordAuthenticationStrategy(String username, String email, String password) {
    return EmailPasswordAuthentication(username, email,password);
  }

  AuthenticationStrategy createGoogleSignInAuthenticationStrategy() {
    return GoogleAuthentication();
  }
}
