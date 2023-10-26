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
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: kDarkColor,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: kPrimaryColor,
      iconTheme: const IconThemeData(
          color: kSecondaryColor
      ),
      elevation: 0,
      titleTextStyle: GoogleFonts.inter(
          color: kSecondaryColor,
          fontSize: 24,
          fontWeight: FontWeight.bold
      ),
    ),
    iconTheme: const IconThemeData(
        color: Colors.white
    ),
    textTheme: GoogleFonts.robotoTextTheme().copyWith(

      labelLarge: const TextStyle(
        color: kSecondaryColor,
        fontSize: 32,
        fontWeight: FontWeight.bold,
        letterSpacing: -0.12,
      ),

      titleMedium: const TextStyle(
        color: kSecondaryColor,
        fontSize: 28,
        fontWeight: FontWeight.bold,
        letterSpacing: -0.12,
      ),

      headlineLarge: const TextStyle(
          color: Colors.black,
          fontSize: 24,
          fontWeight: FontWeight.w600
      ),
      titleLarge: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontSize: 24
      ),
      bodyLarge: const TextStyle(
          color: kSecondaryColor,
          fontSize: 24,
          fontWeight: FontWeight.w600
      ),

      labelMedium: const TextStyle(
        color: Colors.white,
        fontSize: 20,
      ),
      bodyMedium: const TextStyle(
        color: kSecondaryColor,
        fontSize: 20,
      ),

      headlineMedium: const TextStyle(
          color: kDarkColor,
          fontSize: 16,
          fontWeight: FontWeight.w600
      ),

      bodySmall: const TextStyle(
        color: kSecondaryColor,
        fontSize: 14,
      ),
      titleSmall: const TextStyle(
        color: kSecondaryColor,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      labelSmall: const TextStyle(
          color: kPrimaryColor,
          fontSize: 14,
          fontWeight: FontWeight.w700
      ),
      headlineSmall: const TextStyle(
          color: kDarkColor,
          fontSize: 12
      ),
    ),
  );
}