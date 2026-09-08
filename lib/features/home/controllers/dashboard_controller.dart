import 'package:get/get.dart';

class DashboardController extends GetxController {
  final isSearchFocused = false.obs;

  void updateSearchFocus(bool focused) {
    isSearchFocused.value = focused;
  }
}
