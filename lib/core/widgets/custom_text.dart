import 'package:assignment/core/theme/app_color.dart';
import 'package:assignment/core/theme/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final int? maxLines;

  const CustomText({super.key, required this.text, this.fontSize, this.fontWeight, this.color, this.maxLines});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      style: GoogleFonts.lato(
        color: color ?? AppColor.grey,
        fontSize: fontSize ?? AppTypography.bodyMedium.fontSize,
        fontWeight: fontWeight ?? AppTypography.bodyMedium.fontWeight,
      ),
    );
  }
}
