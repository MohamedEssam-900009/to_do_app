import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/app_colors.dart';

ThemeData getAppTheme() {
  return ThemeData(
    primaryColor: AppColors.primary,
    //ScaffoldBackgroundColor
    scaffoldBackgroundColor: AppColors.background,
    //AppBar Theme
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.background,
      centerTitle: true,
    ),
    //Text Theme
    textTheme: TextTheme(
      displayLarge: GoogleFonts.lato(
        fontSize: 32.0,
        fontWeight: FontWeight.w700,
        color: AppColors.white,
      ),
      displayMedium: GoogleFonts.lato(
        fontSize: 16.0,
        fontWeight: FontWeight.w400,
        color: AppColors.white,
      ),
      displaySmall: GoogleFonts.lato(
        fontSize: 16.0,
        color: AppColors.white.withOpacity(.44),
      ),
    ),
    //Button Theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
        ),
      ),
    ),
  );
}

ThemeData getAppDarkTheme() {
  return ThemeData(
    primaryColor: AppColors.red,
    //ScaffoldBackgroundColor
    scaffoldBackgroundColor: AppColors.red,
    //AppBar Theme
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.background,
      centerTitle: true,
    ),
    //Text Theme
    textTheme: TextTheme(
      displayLarge: GoogleFonts.lato(
        fontSize: 32.0,
        fontWeight: FontWeight.w700,
        color: AppColors.white,
      ),
      displayMedium: GoogleFonts.lato(
        fontSize: 16.0,
        fontWeight: FontWeight.w400,
        color: AppColors.white,
      ),
      displaySmall: GoogleFonts.lato(
        fontSize: 16.0,
        color: AppColors.white.withOpacity(.44),
      ),
    ),
    //Button Theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
        ),
      ),
    ),
  );
}
