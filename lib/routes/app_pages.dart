import 'package:flix_pedia/view/screens/home_screen.dart';
import 'package:flix_pedia/view/screens/movie_home_screen.dart';
import 'package:flix_pedia/view/screens/series_home_screen.dart';
import 'package:flix_pedia/view/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

import '../view/screens/join_screen.dart';
import '../view/screens/login_screen.dart';
import 'app_routes.dart';

class AppPages {
  static const initialRoute = Routes.landingRoute;
  static Map<String, WidgetBuilder> routes = {
    // Routes.homeRoute: (context) => const LoginScreen(),
    Routes.landingRoute: (context) => const WelcomeScreen(),
    Routes.loginRoute: (context) => const LoginScreen(),
    //Routes.forgotRoute: (context) => const ForgotScreen(),
    // Routes.changePasswordRoute: (context) => const ChangePassword(),
    Routes.signupRoute: (context) => const JoinScreen(),
    // Routes.verifyRoute: (context) => const VerifyScreen(),
    Routes.homeScreenRoute: (context) => const MainScreen(),
    Routes.movieScreenRoute: (context) => MovieHomeScreen(),
    Routes.seriesScreenRoute: (context) => SeriesHomeScreen(),
    // Routes.profileRoute: (context) => const MyProfile(),
    // Routes.editProfileRoute: (context) => const EditProfile(),
    // Routes.settingRoute: (context) => const SettingScreen(),
    // Routes.privacyRoute: (context) => const PrivacyScreen(),
    // Routes.termConditionRoute: (context) => const TermConditionScreen(),
    // Routes.aboutUsRoute: (context) => const AboutUsScreen(),
  };
}
