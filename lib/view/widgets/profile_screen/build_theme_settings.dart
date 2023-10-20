import 'package:flix_pedia/model/my_theme_model.dart';
import 'package:flutter/material.dart';
import '../../../utils/constants/color_constants.dart';
import '../../../utils/resizer/fetch_pixels.dart';

Widget buildThemeSetting(BuildContext context, MyThemeModel theme) {
  FetchPixels(context);
  return Container(
    decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(FetchPixels.getScale()*kPadding/2)
    ),
    width: double.infinity,
    margin: EdgeInsets.symmetric(
      horizontal: FetchPixels.getPixelWidth(kPadding)
    ),
    padding: EdgeInsets.symmetric(
      horizontal: FetchPixels.getPixelWidth(kPadding),
      vertical: FetchPixels.getPixelHeight(kPadding / 2),
    ),
    child: InkWell(
      onTap: () {
        theme.changeTheme();
      },
      child: Row(
        children: [
          Icon(
            theme.isLightTheme ? Icons.sunny : Icons.nightlight,
            size: FetchPixels.getScale() * 24,
            color: Theme.of(context).textTheme.labelSmall?.color,
          ),
          SizedBox(width: FetchPixels.getPixelWidth(kPadding)),
          Text(
            theme.isLightTheme ? 'Light Mode' : 'Dark Mode',
            style: Theme.of(context).textTheme.labelSmall,
          ),
        ],
      ),
    ),
  );
}