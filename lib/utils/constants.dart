import 'dart:ui';

import 'package:flutter/material.dart';

const kPadding = 20.0;
const kPrimaryColor = Color(0xFFB5EEFF);
const kSecondaryColor = Color(0xFF1F3344);

const kDarkColor = Color(0xA8160E56);
const kDarkSecondaryColor = Colors.redAccent;
const kDarkTextColor = Color(0xFF12153D);
const kDarkTextLightColor = Color(0xFF9A9BB2);
const kDarkFillStarColor = Color(0xFFFCC419);
const kDarkPrimaryColor = Color(0xff11121b);

const kBoxBackgroundDecoration = BoxDecoration(
    image: DecorationImage(
        image: AssetImage('assets/images/dark_join_screen_bg.png'),
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
        offset: Offset(0, 2),
        blurRadius: 2,
      ),
    ],
  );
}

BoxDecoration kBoxDecorationWhiteBackground = BoxDecoration(
    borderRadius: BorderRadius.circular(kPadding),
    color: Colors.white,
    boxShadow: const [
        BoxShadow(
            color: Colors.black38,
            offset: Offset(0,2),
            blurRadius: 2
        )
    ]
);