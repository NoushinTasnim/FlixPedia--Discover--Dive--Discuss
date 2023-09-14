
import 'package:flix_pedia/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData themeData(BuildContext context) {
  return ThemeData(
    hoverColor: Colors.white,
    primaryColor: kPrimaryColor,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.black,
      iconTheme: IconThemeData(
          color: Colors.white
      ),
      elevation: 0,
      titleTextStyle: GoogleFonts.inter(
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontSize: 24
      ),
    ),
    iconTheme: IconThemeData(
        color: Colors.white
    ),
    textTheme: GoogleFonts.robotoTextTheme().copyWith(
      titleLarge: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontSize: 24
      ),
      titleMedium: TextStyle(
        color: kSecondaryColor,
        fontSize: 28,
        fontWeight: FontWeight.bold,
        letterSpacing: -0.12,
      ),
      titleSmall: TextStyle(
        color: kSecondaryColor,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      labelMedium: TextStyle(
        color: Colors.white,
        fontSize: 20,
      ),
      bodyMedium: TextStyle(
        color: kSecondaryColor,
        fontSize: 20,
      ),
    ),
  );
}