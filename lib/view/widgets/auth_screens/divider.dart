import 'package:flix_pedia/utils/resizer/fetch_pixels.dart';
import 'package:flutter/material.dart';


class DividerWidget extends StatelessWidget {
  const DividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    FetchPixels(context);
    return Expanded(
      child: Container(
        height: FetchPixels.getPixelHeight(2),
        decoration: ShapeDecoration(
          color: Theme.of(context).dividerColor,
          shape: RoundedRectangleBorder(
            side: BorderSide(
                width: FetchPixels.getPixelWidth(0.3),
                color: Theme.of(context).dividerColor
            ),
          ),
        ),
      ),
    );
  }
}
