import 'package:flix_pedia/utils/constants/color_constants.dart';
import 'package:flix_pedia/view/widgets/welcome_screen/image_widget.dart';
import 'package:flix_pedia/view/widgets/welcome_screen/text_widgets.dart';
import 'package:flutter/material.dart';
import '../../utils/constants/spacing_constants.dart';
import '../../utils/constants/string_constants.dart';
import '../../utils/resizer/fetch_pixels.dart';
import '../../utils/widget_utils.dart';
import '../widgets/commons/purple_bg_button_small.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    FetchPixels(context);
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      body: Center(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: FetchPixels.getPixelWidth(kPadding),
            vertical: FetchPixels.getPixelHeight(kPadding),
          ),
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
                    text: kWelcomeText3,
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