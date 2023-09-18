import 'package:flix_pedia/constants.dart';
import 'package:flix_pedia/widgets/welcome_screen_widgets/image_widget.dart';
import 'package:flix_pedia/widgets/welcome_screen_widgets/text_widgets.dart';
import 'package:flutter/material.dart';
import '../widgets/welcome_screen_widgets/go_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(kPadding),
        decoration: kBoxBackgroundDecoration,
        child: const SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              WelcomeScreenImage(),
              WelcomeScreenTextWidgets(),
              WelcomeScreenGoButton()
            ],
          ),
        ),
      ),
    );
  }
}