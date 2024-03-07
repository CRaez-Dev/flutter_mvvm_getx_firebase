import 'package:flutter_mvvm_getx_firebase/ui/screens/navigation_2/navigation_2_controller.dart';
import 'package:get/get.dart';

class Navigation2Binding extends Bindings{
  @override
  void dependencies() {

   Get.lazyPut<Navigation2Controller>(() =>  Navigation2Controller());

  }
}