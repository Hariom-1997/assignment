import 'package:flutter/material.dart';

class DashboardProvider with ChangeNotifier {
  bool _isSearchFocused = false;
  bool get isSearchFocused => _isSearchFocused;

  void updateSearchFocus(bool focused) {
    _isSearchFocused = focused;
    notifyListeners();
  }
}
