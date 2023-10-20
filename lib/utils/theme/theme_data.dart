import 'package:flix_pedia/utils/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData themeData(BuildContext context) {
  return ThemeData(
    hoverColor: Colors.white,
    canvasColor: kPrimaryColor,
    cardColor: Colors.black,
    dividerColor: kDarkColor,
    primaryColor: kSecondaryColor,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: kDarkColor,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: kPrimaryColor,
      iconTheme: IconThemeData(
          color: kSecondaryColor
      ),
      elevation: 0,
      titleTextStyle: GoogleFonts.inter(
          color: kSecondaryColor,
          fontSize: 24,
          fontWeight: FontWeight.bold
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
      labelLarge: TextStyle(
        color: kSecondaryColor,
        fontSize: 32,
        fontWeight: FontWeight.bold,
        letterSpacing: -0.12,
      ),
      labelMedium: TextStyle(
        color: Colors.white,
        fontSize: 20,
      ),
      labelSmall: TextStyle(
        color: kDarkColor,
        fontSize: 14,
        fontWeight: FontWeight.w700
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
        color: kPrimaryColor,
        fontSize: 14,
      ),
    ),
  );
}