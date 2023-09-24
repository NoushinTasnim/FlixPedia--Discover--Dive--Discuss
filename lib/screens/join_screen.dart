import 'package:firebase_auth/firebase_auth.dart';
import 'package:flix_pedia/screens/home_screen.dart';
import 'package:flix_pedia/screens/sign_in_screen.dart';
import 'package:flix_pedia/utils/constants.dart';
import 'package:flix_pedia/widgets/auth_screens/alternate_auth_question.dart';
import 'package:flix_pedia/widgets/auth_screens/auth_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../widgets/Commons/purple_bg_button_large.dart';
import '../widgets/auth_screens/text_field_widgets.dart';

class JoinScreen extends StatefulWidget {

  const JoinScreen({super.key});

  @override
  State<JoinScreen> createState() => _JoinScreenState();
}

class _JoinScreenState extends State<JoinScreen> {
  bool _isPasswordVisible = false;
  String email = 'abc@gmail.com', password = '1234';

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
                  'Let\'s Get\nStarted!',
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
                text: 'Email',
                iconData: Icons.mail_outline,
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
                text: 'Create Account',
                onTap: () async {
                    try {
                      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                        email: email, // Replace with your email input field value
                        password: password, // Replace with your password input field value
                      );
                      // User successfully created. You can navigate to the next screen or perform other actions here.
                      print('User signed up: ${userCredential.user}');
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return MainScreen();
                      }));
                    } catch (e) {
                      // Handle any errors that occur during sign-up (e.g., email already exists).
                      print('Error during sign-up: $e');
                    }
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
                text1: 'Already A Member?',
                text2: 'Login',
                onTap: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) {
                        return LoginScreen();
                      }));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}