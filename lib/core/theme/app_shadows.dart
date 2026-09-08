import 'package:flutter/material.dart';
import 'app_color.dart';

class AppShadows {
  static final BoxShadow cardShadow = BoxShadow(
    color: AppColor.black30,
    blurRadius: 10,
    offset: const Offset(0, 4),
  );

  static final BoxShadow buttonShadow = BoxShadow(
    color: AppColor.primaryBlue30,
    blurRadius: 20,
    offset: const Offset(0, 10),
  );

  static final BoxShadow smallBlueShadow = BoxShadow(
    color: AppColor.primaryBlue30,
    blurRadius: 8,
    offset: const Offset(0, 4),
  );

  static const LinearGradient overlayGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      AppColor.transparent,
      AppColor.black,
    ],
  );

  static final LinearGradient overlayGradient75 = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      AppColor.transparent,
      AppColor.black.withValues(alpha: 0.75),
    ],
  );

  static const LinearGradient mainGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      AppColor.blue,
      AppColor.blueGrey,
    ],
  );

  static const LinearGradient dashboardGradient = LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: [
      AppColor.blue,
      AppColor.black,
      AppColor.blue,
    ],
    transform: GradientRotation(0.7),
    stops: [0.0, 0.5, 1.0],
  );
}
