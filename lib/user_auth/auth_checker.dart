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
    var user = result.user;
    // Access the AuthUser instance using Provider.of
    AuthUser authUser = Provider.of<AuthUser>(context, listen: false);

    // Set the values in AuthUser
    authUser.setUsername(user?.displayName ?? 'User');
    authUser.setEmail(user?.email ?? 'Email');
    authUser.setPhotoUrl(user?.photoURL ?? '');
    authUser.setAuthenticationStrategy(authStrategy);
    print('email : ${authUser.username} ${authUser.email} ${authUser.photoUrl} ');
    Constant.replaceScreen(Routes.homeScreenRoute, context);
  } else {
      errorObserver.setError(result.errorMessage!);
  }
}