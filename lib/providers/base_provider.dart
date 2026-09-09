import 'package:assignment/core/constant/app_strings.dart';
import 'package:assignment/core/constant/asset_constant.dart';
import 'package:flutter/material.dart';

class BaseProvider with ChangeNotifier {
  AnimationController? _animationController;

  AnimationController? get animationController => _animationController;

  late Animation<Offset> slideAnimation;
  late Animation<double> fadeAnimation;

  String _activeScreen = AppStrings.dashboard;
  String get activeScreen => _activeScreen;

  set activeScreen(String value) {
    _activeScreen = value;
    notifyListeners();
  }

  final List<Map<String, String>> allLocations = [
    {
      'name': AppStrings.torontoCanada,
      'distance': AppStrings.distance150km,
      'available': AppStrings.oct24_25,
      'price': AppStrings.price50,
      'imagePath': AppAssets.bgImage1,
    },
    {
      'name': AppStrings.vancouverCanada,
      'distance': AppStrings.distance200km,
      'available': AppStrings.nov15_20,
      'price': AppStrings.price75,
      'imagePath': AppAssets.bgImage2,
    },
    {
      'name': AppStrings.calgaryCanada,
      'distance': AppStrings.distance180km,
      'available': AppStrings.dec01_05,
      'price': AppStrings.price60,
      'imagePath': AppAssets.bgImage1,
    },
  ];

  List<Map<String, String>> _filteredLocations = [];

  List<Map<String, String>> get filteredLocations => _filteredLocations;

  void init(TickerProvider vsync) {
    _filteredLocations = List.from(allLocations);

    _animationController?.dispose();

    _animationController = AnimationController(
      vsync: vsync,
      duration: const Duration(milliseconds: 500),
    );

    slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0),
      end: const Offset(360, 0),
    ).animate(
      CurvedAnimation(
        parent: _animationController!,
        curve: Curves.easeInOut,
      ),
    );

    fadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _animationController!,
        curve: Curves.easeIn,
      ),
    );

    _animationController!.addListener(notifyListeners);

    notifyListeners();
  }

  void filterLocations(String query) {
    if (query.isEmpty) {
      _filteredLocations = List.from(allLocations);
    } else {
      _filteredLocations = allLocations
          .where(
            (location) => location['name']!
            .toLowerCase()
            .contains(query.toLowerCase()),
      )
          .toList();
    }

    notifyListeners();
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }
}