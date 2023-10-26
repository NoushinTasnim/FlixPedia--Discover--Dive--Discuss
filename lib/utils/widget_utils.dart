import 'package:flutter/material.dart';
import 'constants/color_constants.dart';

const kBoxBackgroundDecoration = BoxDecoration(
    image: DecorationImage(
        image: AssetImage('assets/images/join_screen_bg.png'),
        fit: BoxFit.cover
    )
);

BoxDecoration kBoxButtonBackgroundDecoration(BuildContext context) {
  return BoxDecoration(
    color: Theme.of(context).primaryColor,
    borderRadius: BorderRadius.circular(kPadding),
    border: Border.all(
        color: Theme.of(context).primaryColor,
        strokeAlign: BorderSide.strokeAlignInside
    ),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.3),
        offset: const Offset(0, 2),
        blurRadius: 2,
      ),
    ],
  );
}

BoxDecoration kBoxDecorationWhiteBackground = BoxDecoration(
    borderRadius: BorderRadius.circular(kPadding*10),
    color: Colors.white,
    boxShadow: const [
      BoxShadow(
          color: Colors.black38,
          offset: Offset(0,2),
          blurRadius: 2
      )
    ]
);