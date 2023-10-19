import 'package:flix_pedia/utils/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData darkThemeData(BuildContext context) {
  return ThemeData(
    hoverColor: Colors.black,
    canvasColor: kDarkPrimaryColor,
    primaryColor: kDarkSecondaryColor,
    dividerColor: kDarkTextLightColor,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: kDarkBottomNavColor,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: kDarkPrimaryColor.withOpacity(0.0),
      iconTheme: IconThemeData(
          color: kDarkSecondaryColor
      ),
      elevation: 0,
      titleTextStyle: GoogleFonts.inter(
          color: kDarkSecondaryColor,
          fontSize: 24,
          fontWeight: FontWeight.bold
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
      labelSmall: TextStyle(
        color:  Colors.white,
        fontSize: 14,
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