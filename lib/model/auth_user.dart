import 'package:flix_pedia/user_auth/authentication_strategy.dart';
import 'package:flutter/material.dart';

class AuthUser extends ChangeNotifier{
  String _username = '';
  String _email = '';
  String _photoUrl = '';
  late AuthenticationStrategy _authenticationStrategy;

  void setUsername(String username){
    _username = username;
    notifyListeners();
  }

  String get username => _username;

  void setEmail(String email){
    _email = email;
    notifyListeners();
  }

  String get email => _email;

  void setPhotoUrl(String photoUrl){
    _photoUrl = photoUrl;
    notifyListeners();
  }

  String get photoUrl => _photoUrl;

  void setAuthenticationStrategy(AuthenticationStrategy authenticationStrategy){
    _authenticationStrategy = authenticationStrategy;
    notifyListeners();
  }

  AuthenticationStrategy get authenticationStrategy => _authenticationStrategy;
}