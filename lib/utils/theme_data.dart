
import 'package:flix_pedia/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData themeData(BuildContext context) {
  return ThemeData(
    hoverColor: Colors.white,
    canvasColor: kPrimaryColor,
    dividerColor: kDarkColor,
    primaryColor: kSecondaryColor,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      iconTheme: IconThemeData(
          color: kDarkColor
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
      headlineSmall: TextStyle(
        color: kDarkColor,
        fontSize: 12
      ),
      headlineMedium: TextStyle(
        color: kDarkColor,
        fontSize: 16,
        fontWeight: FontWeight.w600
      ),
      headlineLarge: TextStyle(
          color: Colors.black,
          fontSize: 24,
          fontWeight: FontWeight.w600
      ),
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
      bodyLarge: TextStyle(
        color: kSecondaryColor,
        fontSize: 24,
        fontWeight: FontWeight.w600
      ),
      bodyMedium: TextStyle(
        color: kSecondaryColor,
        fontSize: 20,
      ),
      bodySmall: TextStyle(
        color: kDarkColor,
        fontSize: 16,
      ),
    ),
  );
}

ThemeData darkThemeData(BuildContext context) {
  return ThemeData(
    hoverColor: Colors.black,
    canvasColor: kDarkPrimaryColor,
    primaryColor: kDarkSecondaryColor,
    dividerColor: kDarkTextLightColor,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
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
      headlineSmall: TextStyle(
          color: kDarkSecondaryColor,
          fontSize: 12
      ),
      headlineMedium: TextStyle(
          color: kDarkSecondaryColor,
          fontSize: 16,
          fontWeight: FontWeight.w600
      ),
      headlineLarge: TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.w600
      ),
      titleLarge: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontSize: 24
      ),
      titleMedium: TextStyle(
        color: kDarkSecondaryColor,
        fontSize: 28,
        fontWeight: FontWeight.bold,
        letterSpacing: -0.12,
      ),
      titleSmall: TextStyle(
        color: kDarkSecondaryColor,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      labelMedium: TextStyle(
        color: kDarkTextColor,
        fontSize: 20,
      ),
      bodyLarge: TextStyle(
          color: kDarkSecondaryColor,
          fontSize: 24,
          fontWeight: FontWeight.w600
      ),
      bodyMedium: TextStyle(
        color: kDarkSecondaryColor,
        fontSize: 20,
      ),
      bodySmall: TextStyle(
        color: kDarkTextLightColor,
        fontSize: 16,
      ),
    ),
  );
}