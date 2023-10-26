import 'package:flix_pedia/utils/resizer/fetch_pixels.dart';
import 'package:flutter/material.dart';
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
          horizontal: FetchPixels.getPixelWidth(kPadding/1.5)
      ),
      child: Image.asset(
        'assets/images/icon.png',
        width: 10,
      ),
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: kPadding),
        child: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.search,
          ),
        ),
      ),
    ],
  );
}