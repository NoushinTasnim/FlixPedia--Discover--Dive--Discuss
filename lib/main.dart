import 'package:firebase_core/firebase_core.dart';
import 'package:flix_pedia/firebase_options.dart';
import 'package:flix_pedia/model/auth_user.dart';
import 'package:flix_pedia/routes/app_pages.dart';
import 'package:flix_pedia/user_auth/authentication_factory.dart';
import 'package:flix_pedia/utils/theme/dark_theme_data.dart';
import 'package:flix_pedia/utils/theme/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'model/my_theme_model.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );

  MyThemeModel themeModel = MyThemeModel();
  await themeModel.loadThemeFromPrefs();
  // await callMovieAPIs();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    AuthenticationStrategyFactory authenticationStrategyFactory = AuthenticationStrategyFactory();
    authenticationStrategyFactory.getLogIn(context);
    return ChangeNotifierProvider(
      create: (context) => MyThemeModel(),
      child: ChangeNotifierProvider(
        create: (context) => AuthUser(), // Example of another provider
        child: Consumer2<MyThemeModel, AuthUser>(
          builder: (context, theme, authUser, child) => MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: themeData(context),
            darkTheme: darkThemeData(context),
            themeMode: theme.isLightTheme==true ? ThemeMode.light : ThemeMode.dark,
            initialRoute: "/",
            routes: AppPages.routes,
          ),
        ),
      ),
    );
  }
}