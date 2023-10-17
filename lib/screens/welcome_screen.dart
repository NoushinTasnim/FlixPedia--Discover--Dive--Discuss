import 'package:flix_pedia/utils/constants.dart';
import 'package:flix_pedia/widgets/welcome_screen_widgets/image_widget.dart';
import 'package:flix_pedia/widgets/welcome_screen_widgets/text_widgets.dart';
import 'package:flutter/material.dart';
import '../widgets/Commons/purple_bg_button_small.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      body: Center(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          padding: EdgeInsets.all(kPadding),
          decoration: kBoxBackgroundDecoration,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  WelcomeScreenImage(),
                  WelcomeScreenTextWidgets(),
                  PurpleBackgroundButtonSmall(
                    text: 'Let\'s Go',
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}