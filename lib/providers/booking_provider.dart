import 'package:flutter/material.dart';

class BookingProvider with ChangeNotifier {
  DateTime _currentMonth = DateTime(2026, 8);
  DateTime get currentMonth => _currentMonth;

  void previousMonth() {
    _currentMonth = DateTime(_currentMonth.year, _currentMonth.month - 1);
    notifyListeners();
  }

  void nextMonth() {
    _currentMonth = DateTime(_currentMonth.year, _currentMonth.month + 1);
    notifyListeners();
  }
}
