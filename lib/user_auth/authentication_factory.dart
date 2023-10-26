import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  Future<void> getLogIn(BuildContext context)async {
    final AuthenticationStrategyFactory strategyFactory = AuthenticationStrategyFactory();
    late AuthenticationStrategy authStrategy;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if(preferences.getString('authenticationStrategy')=='google'){
      authStrategy = strategyFactory.createEmailPasswordAuthenticationStrategy(
          'x',
          'email',
          'password'
      );
      authStrategy.loadUser(preferences, context);
    }
    else if(preferences.getString('authenticationStrategy')=='emailPass'){
      authStrategy = strategyFactory.createGoogleSignInAuthenticationStrategy();
      authStrategy.loadUser(preferences, context);
    }
  }
}
