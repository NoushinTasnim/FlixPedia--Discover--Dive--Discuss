import 'package:flix_pedia/utils/resizer/fetch_pixels.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../../../model/my_theme_model.dart';
import '../../../utils/constants/color_constants.dart';

AppBar buildAppBar(BuildContext context, String text) {
  FetchPixels(context);
  return AppBar(
    scrolledUnderElevation: 2,
    centerTitle: true,
    title: Text(
        text,
    ),
    leading: Padding(
      padding: EdgeInsets.symmetric(
          horizontal: FetchPixels.getPixelWidth(kPadding/2)
      ),
      child: SvgPicture.asset(
        'assets/icons/app_icon.svg',
        width: 40,
      ),
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: kPadding),
        child: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.search,
          ),
        ),
      ),
    ],
  );
}