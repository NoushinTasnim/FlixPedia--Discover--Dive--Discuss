import 'package:flix_pedia/screens/welcome_screen.dart';
import 'package:flix_pedia/theme_data.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: themeData(context),
      themeMode: ThemeMode.light,
      home:WelcomeScreen(),
    );
  }
}
