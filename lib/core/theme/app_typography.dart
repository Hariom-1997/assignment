import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_color.dart';

class AppTypography {
  static TextStyle get h0 => GoogleFonts.lato(
    fontSize: 36,
    fontWeight: FontWeight.bold,
    color: AppColor.white,
  );

  static TextStyle get hTitle => GoogleFonts.lato(
    fontSize: 29,
    fontWeight: FontWeight.w500,
    color: AppColor.white,
  );

  static TextStyle get titleXLarge => GoogleFonts.lato(
    fontSize: 23,
    fontWeight: FontWeight.bold,
    color: AppColor.white,
  );

  static TextStyle get h2 => GoogleFonts.lato(
    fontSize: 21,
    fontWeight: FontWeight.w600,
    color: AppColor.white,
  );

  static TextStyle get titleLarge => GoogleFonts.lato(
    fontSize: 19,
    fontWeight: FontWeight.bold,
    color: AppColor.white,
  );

  static TextStyle get titleMedium => GoogleFonts.lato(
    fontSize: 17,
    fontWeight: FontWeight.w700,
    color: AppColor.white,
  );

  static TextStyle get bodyLarge => GoogleFonts.lato(
    fontSize: 17,
    color: AppColor.white,
  );

  static TextStyle get bodyMedium => GoogleFonts.lato(
    fontSize: 15,
    color: AppColor.white,
  );

  static TextStyle get bodySmall => GoogleFonts.lato(
    fontSize: 13,
    color: AppColor.grey400,
  );

  static TextStyle get badge => GoogleFonts.lato(
    fontSize: 13,
    fontWeight: FontWeight.w700,
    color: AppColor.white,
  );

  static TextStyle get badgeOrange => GoogleFonts.lato(
    fontSize: 13,
    fontWeight: FontWeight.w600,
    color: AppColor.orange,
  );

  static TextStyle get linkOrange => GoogleFonts.lato(
    fontSize: 17,
    fontWeight: FontWeight.w600,
    color: AppColor.deepOrange,
    decoration: TextDecoration.underline,
  );

  static TextStyle get calendarDay => GoogleFonts.lato(
    fontSize: 17,
    fontWeight: FontWeight.w500,
    color: AppColor.white,
  );

  static TextStyle get weekday => GoogleFonts.lato(
    fontSize: 15,
    fontWeight: FontWeight.w500,
    color: AppColor.grey500,
  );
}
