import 'package:flix_pedia/utils/constants.dart';
import 'package:flix_pedia/widgets/auth_screens/alternate_auth_question.dart';
import 'package:flix_pedia/widgets/auth_screens/auth_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../widgets/Commons/purple_bg_button_large.dart';
import '../widgets/auth_screens/text_field_widgets.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Theme.of(context).canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.only(
            top: kPadding*5,
            left: kPadding*2,
            right: kPadding*2,
            bottom: kPadding
        ),
        decoration:kBoxBackgroundDecoration,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  'Welcome Back!',
                  style: Theme.of(context).textTheme.titleMedium
              ),
              SizedBox(
                height: kPadding*2,
              ),
              TextFieldWidget(
                text: 'Username',
                iconData: Icons.person_outline,
              ),
              SizedBox(
                height: kPadding/2,
              ),
              TextFieldWidget(
                iconData: Icons.lock_outline,
                text: 'Password',
                obscureText: true,
              ),
              SizedBox(
                height: kPadding,
              ),
              PurpleBackgroundButtonLarge(
                text: 'Login',
                onTap: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) {
                        return MainScreen();
                      }));
                },
              ),
              SizedBox(
                height: kPadding*2,
              ),
              AuthDividerWidget(),
              SizedBox(
                height: kPadding,
              ),
              Center(
                child: Container(
                  padding: EdgeInsets.all(kPadding),
                  decoration: kBoxDecorationWhiteBackground,
                  child: SvgPicture.asset(
                    'assets/icons/google.svg',
                  ),
                ),
              ),
              SizedBox(
                height: kPadding,
              ),
              AlternateAuthWidget(
                text1: 'Not A Member Yet?',
                text2: 'Register',
                onTap: (){
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}