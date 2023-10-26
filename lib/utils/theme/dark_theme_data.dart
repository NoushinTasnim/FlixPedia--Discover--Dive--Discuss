import 'package:flix_pedia/utils/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData darkThemeData(BuildContext context) {
  return ThemeData(
    hoverColor: Colors.black,
    canvasColor: kDarkPrimaryColor,
    primaryColor: kDarkSecondaryColor,
    dividerColor: kDarkSecondaryColor,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: kDarkBottomNavColor,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: kDarkPrimaryColor.withOpacity(0.0),
      iconTheme: const IconThemeData(
          color: kDarkSecondaryColor
      ),
      elevation: 0,
      titleTextStyle: GoogleFonts.inter(
          color: kDarkSecondaryColor,
          fontSize: 24,
          fontWeight: FontWeight.bold
      ),
    ),
    iconTheme: const IconThemeData(
        color: Colors.white
    ),
    textTheme: GoogleFonts.robotoTextTheme().copyWith(
      labelLarge: const TextStyle(
        color: kDarkTextLightColor,
        fontSize: 32,
        fontWeight: FontWeight.bold,
        letterSpacing: -0.12,
      ),

      titleMedium: const TextStyle(
        color: kDarkSecondaryColor,
        fontSize: 28,
        fontWeight: FontWeight.bold,
        letterSpacing: -0.12,
      ),

      headlineLarge: const TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.w600
      ),
      titleLarge: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontSize: 24
      ),
      bodyLarge: const TextStyle(
          color: kDarkSecondaryColor,
          fontSize: 24,
          fontWeight: FontWeight.w600
      ),

      bodyMedium: const TextStyle(
        color: kDarkTextLightColor,
        fontSize: 20,
      ),
      labelMedium: const TextStyle(
        color: kDarkTextColor,
        fontSize: 20,
      ),

      headlineMedium: const TextStyle(
          color: kDarkSecondaryColor,
          fontSize: 16,
          fontWeight: FontWeight.w600
      ),

      titleSmall: const TextStyle(
        color: kDarkBottomNavColor,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      labelSmall: const TextStyle(
        color:  Colors.white,
        fontSize: 14,
      ),
      bodySmall: const TextStyle(
        color: kDarkSecondaryColor,
        fontSize: 14,
        fontWeight: FontWeight.w700
      ),
      headlineSmall: const TextStyle(
          color: kDarkSecondaryColor,
          fontSize: 12
      ),
    ),
  );
}