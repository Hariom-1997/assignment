import 'package:get/get.dart';

class BookingController extends GetxController {
  final currentMonth = DateTime(2026, 8).obs;

  void previousMonth() {
    currentMonth.value = DateTime(currentMonth.value.year, currentMonth.value.month - 1);
  }

  void nextMonth() {
    currentMonth.value = DateTime(currentMonth.value.year, currentMonth.value.month + 1);
  }
}
