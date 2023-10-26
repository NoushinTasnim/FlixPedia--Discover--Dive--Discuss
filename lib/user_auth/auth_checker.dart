import 'package:firebase_auth/firebase_auth.dart';
import 'package:flix_pedia/user_auth/strategy/authentication_strategy.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../model/auth_result.dart';
import '../model/auth_user.dart';
import '../observers/error_observer.dart';
import '../routes/app_routes.dart';
import '../utils/constants/spacing_constants.dart';

Future<void> checkAuth(AuthenticationStrategy authStrategy, ErrorObserver errorObserver, BuildContext context) async {
  AuthResult result = await authStrategy.signUp();
  if (result.user != null) {
    saveData(result.user!, context, authStrategy);
    Constant.replaceScreen(Routes.loadingScreenRoute, context);
  } else {
      errorObserver.setError(result.errorMessage!);
  }
}

User? getCurrentUser(){
  return FirebaseAuth.instance.currentUser;
}

void saveData(User user, BuildContext context, AuthenticationStrategy authStrategy){
  // Access the AuthUser instance using Provider.of
  AuthUser authUser = Provider.of<AuthUser>(context, listen: false);

  // Set the values in AuthUser
  authUser.setUsername(user?.displayName ?? 'User');
  authUser.setEmail(user?.email ?? 'Email');
  authUser.setPhotoUrl(user?.photoURL ?? '');
  authUser.setAuthenticationStrategy(authStrategy);
}