import 'package:flutter/material.dart';

class AppSpacing {
  // Spacing values
  static const double s4 = 4.0;
  static const double s6 = 6.0;
  static const double s8 = 8.0;
  static const double s12 = 12.0;
  static const double s16 = 16.0;
  static const double s20 = 20.0;
  static const double s24 = 24.0;
  static const double s32 = 32.0;
  static const double s40 = 40.0;
  static const double s48 = 48.0;
  static const double s60 = 60.0;

  // EdgeInsets
  static const EdgeInsets p2 = EdgeInsets.all(2.0);
  static const EdgeInsets p6 = EdgeInsets.all(6.0);
  static const EdgeInsets p8 = EdgeInsets.all(8.0);
  static const EdgeInsets p16 = EdgeInsets.all(16.0);
  static const EdgeInsets p24 = EdgeInsets.all(24.0);

  static const EdgeInsets px12 = EdgeInsets.symmetric(horizontal: 12.0);
  static const EdgeInsets px16 = EdgeInsets.symmetric(horizontal: 16.0);
  
  static const EdgeInsets py12 = EdgeInsets.symmetric(vertical: 12.0);
  
  static const EdgeInsets phv12_6 = EdgeInsets.symmetric(horizontal: 12, vertical: 6);
  static const EdgeInsets phv15_20 = EdgeInsets.symmetric(horizontal: 15, vertical: 20);
  static const EdgeInsets phv16_16 = EdgeInsets.symmetric(horizontal: 16, vertical: 16);
  static const EdgeInsets phv20_24 = EdgeInsets.symmetric(horizontal: 20, vertical: 24);
  static const EdgeInsets phv20_4 = EdgeInsets.symmetric(horizontal: 20, vertical: 4);
  static const EdgeInsets phv20_16 = EdgeInsets.symmetric(horizontal: 20, vertical: 16);
  static const EdgeInsets phv14_12 = EdgeInsets.symmetric(horizontal: 14, vertical: 12);

  // Specific Screen Spacing
  static const EdgeInsets hotelCardPadding = EdgeInsets.fromLTRB(12, 22, 20, 20);
  static const EdgeInsets hotelDescriptionPadding = EdgeInsets.fromLTRB(20, 8, 20, 36);

  // SizedBox
  static const SizedBox h4 = SizedBox(height: s4);
  static const SizedBox h6 = SizedBox(height: 6.0);
  static const SizedBox h8 = SizedBox(height: s8);
  static const SizedBox h12 = SizedBox(height: 12.0);
  static const SizedBox h16 = SizedBox(height: s16);
  static const SizedBox h20 = SizedBox(height: s20);
  static const SizedBox h24 = SizedBox(height: s24);
  static const SizedBox h32 = SizedBox(height: s32);
  static const SizedBox h40 = SizedBox(height: s40);
  static const SizedBox h48 = SizedBox(height: s48);

  static const SizedBox w6 = SizedBox(width: s6);
  static const SizedBox w8 = SizedBox(width: s8);
  static const SizedBox w12 = SizedBox(width: s12);
  static const SizedBox w15 = SizedBox(width: 15.0);
  static const SizedBox w16 = SizedBox(width: 16.0);
  static const SizedBox w40 = SizedBox(width: 40.0);
  static const SizedBox w60 = SizedBox(width: s60);
}
