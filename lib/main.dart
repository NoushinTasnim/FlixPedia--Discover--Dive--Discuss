import 'package:firebase_core/firebase_core.dart';
import 'package:flix_pedia/firebase_options.dart';
import 'package:flix_pedia/screens/welcome_screen.dart';
import 'package:flix_pedia/utils/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'model/my_theme_model.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => MyThemeModel(),
        child: Consumer<MyThemeModel>(
          builder: (context, theme, child) => MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: themeData(context),
            darkTheme: darkThemeData(context),
            themeMode: theme.isLightTheme? ThemeMode.light: ThemeMode.dark,
            home: WelcomeScreen(),
          ),
        )
    );
  }
}