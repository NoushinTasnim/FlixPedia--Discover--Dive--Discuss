import 'package:flix_pedia/view/screens/home_screen.dart';
import 'package:flix_pedia/view/screens/movie_home_screen.dart';
import 'package:flix_pedia/view/screens/settings_screen.dart';
import 'package:flix_pedia/view/screens/series_home_screen.dart';
import 'package:flix_pedia/view/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import '../view/screens/join_screen.dart';
import '../view/screens/loading_screen.dart';
import '../view/screens/login_screen.dart';
import 'app_routes.dart';

class AppPages {
  static const initialRoute = Routes.landingRoute;
  static Map<String, WidgetBuilder> routes = {
    Routes.landingRoute: (context) => const WelcomeScreen(),
    Routes.loginRoute: (context) => const LoginScreen(),
    Routes.signupRoute: (context) => const JoinScreen(),
    Routes.loadingScreenRoute: (context) => const LoadingScreen(),
    Routes.homeScreenRoute: (context) => const MainScreen(),
    Routes.movieScreenRoute: (context) => MovieHomeScreen(),
    Routes.seriesScreenRoute: (context) => SeriesHomeScreen(),
    Routes.profileScreenRoute: (context) => const ProfileScreen(),
  };
}
