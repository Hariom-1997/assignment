import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_color.dart';
import 'app_typography.dart';

class AppTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: AppColor.blue,
      scaffoldBackgroundColor: AppColor.blue,
      colorScheme: const ColorScheme.dark(
        primary: AppColor.blue,
        secondary: AppColor.primaryBlue,
        surface: AppColor.blueGrey,
      ),
      textTheme: GoogleFonts.poppinsTextTheme(TextTheme(
        displayLarge: AppTypography.h0,
        headlineMedium: AppTypography.h2,
        titleLarge: AppTypography.titleLarge,
        bodyLarge: AppTypography.bodyLarge,
        bodyMedium: AppTypography.bodyMedium,
      )),
    );
  }
}
