import 'package:get/get.dart';

class Navigation2Controller extends GetxController {
  // BottonNavigation states
  RxInt currentIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

// BottonNavigation methods
  void updateCurrentIndex(int value) => currentIndex.value = value;
}
