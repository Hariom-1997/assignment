import 'package:assignment/core/constant/app_strings.dart';
import 'package:assignment/core/constant/asset_constant.dart';
import 'package:flutter/animation.dart';
import 'package:get/get.dart';

class BaseViewController extends GetxController with GetSingleTickerProviderStateMixin{


  late AnimationController animationController;
  late Animation<Offset> slideAnimation;
  late Animation<double> fadeAnimation;
  final activeScreen = AppStrings.dashboard.obs;

  final allLocations = [
    {
      'name': AppStrings.torontoCanada,
      'distance': AppStrings.distance150km,
      'available': AppStrings.oct24_25,
      'price': AppStrings.price50,
      'imagePath': AppAssets.bg1,
    },
    {
      'name': AppStrings.vancouverCanada,
      'distance': AppStrings.distance200km,
      'available': AppStrings.nov15_20,
      'price': AppStrings.price75,
      'imagePath': AppAssets.bg2,
    },
    {
      'name': AppStrings.calgaryCanada,
      'distance': AppStrings.distance180km,
      'available': AppStrings.dec01_05,
      'price': AppStrings.price60,
      'imagePath': AppAssets.bg1,
    },
  ];

  final filteredLocations = <Map<String, String>>[].obs;

  @override
  void onInit() {
    filteredLocations.assignAll(allLocations);
    animationController =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 500));
    slideAnimation =
        Tween<Offset>(begin: const Offset(0, 0), end: const Offset(360, 0)).animate(
            CurvedAnimation(
                parent: animationController, curve: Curves.easeInOut));
    fadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.easeIn,
    ));
    super.onInit();
  }

  void filterLocations(String query) {
    if (query.isEmpty) {
      filteredLocations.assignAll(allLocations);
    } else {
      filteredLocations.assignAll(allLocations
          .where((location) =>
              location['name']!.toLowerCase().contains(query.toLowerCase()))
          .toList());
    }
  }
}
