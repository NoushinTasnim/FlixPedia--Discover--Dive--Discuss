import 'package:flix_pedia/utils/resizer/fetch_pixels.dart';
import 'package:flutter/material.dart';


class AlternateAuthWidget extends StatelessWidget {

  final text1;
  final text2;
  final onTap;

  const AlternateAuthWidget({
    super.key,
    required this.text1,
    required this.text2,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    FetchPixels(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text1 + " ",
          style: Theme.of(context).textTheme.titleSmall,
        ),
        InkWell(
          onTap: onTap,
          child: Text(
            text2,
            style: TextStyle(
                color: Theme.of(context).primaryColor,
                decoration: TextDecoration.underline,
                fontSize: FetchPixels.getTextScale()*14,
                fontWeight: FontWeight.bold
            ),
          ),
        ),
      ],
    );
  }
}
