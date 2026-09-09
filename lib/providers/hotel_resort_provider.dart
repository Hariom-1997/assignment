import 'package:flutter/material.dart';

class HotelResortProvider with ChangeNotifier {
  int _currentImage = 0;
  int get currentImage => _currentImage;

  void updateImage(int index) {
    _currentImage = index;
    notifyListeners();
  }
}
