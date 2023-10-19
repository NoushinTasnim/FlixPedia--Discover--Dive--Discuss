import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../model/my_theme_model.dart';
import '../../../utils/constants/color_constants.dart';
import '../../../utils/resizer/fetch_pixels.dart';

class WelcomeScreenImage extends StatelessWidget {
  const WelcomeScreenImage({super.key});

  @override
  Widget build(BuildContext context) {
    FetchPixels(context);
    return Consumer<MyThemeModel>(
      builder: (context, theme, child) =>
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: FetchPixels.getPixelWidth(kPadding),
              vertical: FetchPixels.getPixelHeight(kPadding),
            ),
            child: Image(
              image: theme.isLightTheme ? AssetImage('assets/images/movie.png') : AssetImage('assets/images/dark_movie.png'),
            ),
          )
    );
  }
}
