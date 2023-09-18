import 'dart:ui';

import 'package:flutter/material.dart';

const kPadding = 20.0;
const kPrimaryColor = Color(0xFFAADFF1);
const kSecondaryColor = Color(0xFF86328C);

const kBoxBackgroundDecoration = BoxDecoration(
    image: DecorationImage(
        image: AssetImage('assets/images/join_screen_bg.png'),
        fit: BoxFit.cover
    )
);

BoxDecoration kBoxButtonBackgroundDecoration = BoxDecoration(
    color: kSecondaryColor,
    borderRadius: BorderRadius.circular(kPadding),
    border: Border.all(
        color: kSecondaryColor,
        strokeAlign: BorderSide.strokeAlignInside
    ),
    boxShadow: [
        BoxShadow(
            color: Colors.black.withOpacity(0.3),
            offset: Offset(0,2),
            blurRadius: 2
        )
    ]
);