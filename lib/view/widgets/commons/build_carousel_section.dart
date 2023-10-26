import 'package:flix_pedia/utils/resizer/fetch_pixels.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/color_constants.dart';
import '../movie_screen/carousel.dart';

Widget buildCarouselSection(BuildContext context, String title, var contentList) {
  FetchPixels(context);
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: EdgeInsets.only(
          top: FetchPixels.getPixelHeight(kPadding),
          left: FetchPixels.getPixelWidth(kPadding),
          right: FetchPixels.getPixelWidth(kPadding),
        ),
        child: Text(
          title,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
      Carousel(contentList: contentList),
    ],
  );
}