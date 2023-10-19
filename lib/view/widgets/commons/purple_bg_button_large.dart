import 'package:flix_pedia/utils/resizer/fetch_pixels.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/color_constants.dart';
import '../../screens/join_screen.dart';
import '../../../utils/constants/spacing_constants.dart';
import '../../../utils/widget_utils.dart';

class PurpleBackgroundButtonLarge extends StatelessWidget {
  String text;
  var onTap;

  PurpleBackgroundButtonLarge({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    FetchPixels(context);
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(
          vertical: kPadding*2,
        ),
        padding: EdgeInsets.symmetric(
          vertical: FetchPixels.getPixelHeight(kPadding/2),
          horizontal: FetchPixels.getPixelWidth(kPadding*2),
        ),
        decoration: kBoxButtonBackgroundDecoration(context),
        child: Text(
          text,
          style: Theme.of(context).textTheme.labelMedium,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
