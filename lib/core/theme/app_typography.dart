import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_color.dart';

class AppTypography {
  static TextStyle get h0 => GoogleFonts.poppins(
    fontSize: 35,
    fontWeight: FontWeight.bold,
    color: AppColor.white,
  );

  static TextStyle get hTitle => GoogleFonts.poppins(
    fontSize: 28,
    fontWeight: FontWeight.w500,
    color: AppColor.white,
  );

  static TextStyle get titleXLarge => GoogleFonts.poppins(
    fontSize: 22,
    fontWeight: FontWeight.bold,
    color: AppColor.white,
  );

  static TextStyle get h2 => GoogleFonts.poppins(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColor.white,
  );

  static TextStyle get titleLarge => GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: AppColor.white,
  );

  static TextStyle get titleMedium => GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: AppColor.white,
  );

  static TextStyle get bodyLarge => GoogleFonts.poppins(
    fontSize: 16,
    color: AppColor.white,
  );

  static TextStyle get bodyMedium => GoogleFonts.poppins(
    fontSize: 14,
    color: AppColor.white,
  );

  static TextStyle get bodySmall => GoogleFonts.poppins(
    fontSize: 12,
    color: AppColor.grey400,
  );

  static TextStyle get badge => GoogleFonts.poppins(
    fontSize: 12,
    fontWeight: FontWeight.w700,
    color: AppColor.white,
  );

  static TextStyle get badgeOrange => GoogleFonts.poppins(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: AppColor.orange,
  );

  static TextStyle get linkOrange => GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColor.deepOrange,
    decoration: TextDecoration.underline,
  );

  static TextStyle get calendarDay => GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColor.white,
  );

  static TextStyle get weekday => GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColor.grey500,
  );
}
