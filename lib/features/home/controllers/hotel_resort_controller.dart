import 'package:get/get.dart';

class HotelResortController extends GetxController {
  final currentImage = 0.obs;

  void updateImage(int index) {
    currentImage.value = index;
  }
}
