import 'package:flutter_mvvm_getx_firebase/ui/screens/counter/counter_controller.dart';
import 'package:get/get.dart';

class CounterBinding implements Bindings{
  @override
  void dependencies() {    
    Get.lazyPut<CounterController>(() => CounterController());
  }  
}