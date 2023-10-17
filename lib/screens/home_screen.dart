import 'package:animations/animations.dart';
import 'package:flix_pedia/screens/series_home_screen.dart';
import 'package:fluid_bottom_nav_bar/fluid_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'movie/movie_home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  int pageIndex = 0;

  List<Widget> pageList = <Widget>[
    MovieHomeScreen(),
    SeriesHomeScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).canvasColor,
        extendBodyBehindAppBar: true,
        extendBody: true,
        body: PageTransitionSwitcher(
          transitionBuilder: (
              child,
              primaryAnimation,
              secondaryAnimation,
              ) => FadeThroughTransition(
            fillColor: Theme.of(context).canvasColor,
            animation: primaryAnimation,
            secondaryAnimation: secondaryAnimation,
            child: child,
          ),
          child: pageList[pageIndex],
        ),
        bottomNavigationBar: FluidNavBar(
          scaleFactor: 2,
          icons: [
            FluidNavBarIcon(icon: Icons.movie),
            FluidNavBarIcon(icon: Icons.local_movies),
          ],
          onChange: (value){
            print(value);
            setState(() {
              pageIndex = value;
            });
          },
          style: FluidNavBarStyle(
              barBackgroundColor: Theme.of(context).primaryColor,
              iconBackgroundColor: Theme.of(context).primaryColor,
              iconSelectedForegroundColor: Theme.of(context).canvasColor,
              iconUnselectedForegroundColor: Colors.white
          ),
        )
    );
  }
}