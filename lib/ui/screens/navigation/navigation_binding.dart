import 'package:flutter_mvvm_getx_firebase/ui/screens/navigation/navigation_controller.dart';
import 'package:get/get.dart';

class NavigationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NavigationController>(() => NavigationController());    
  }
}