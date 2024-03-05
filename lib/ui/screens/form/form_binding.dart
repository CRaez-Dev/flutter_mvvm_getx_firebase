import 'package:flutter_mvvm_getx_firebase/ui/screens/form/form_controller.dart';
import 'package:get/get.dart';

class FormBinding extends Bindings{
  @override
  void dependencies() {    
    Get.lazyPut(() => FormController());
  }
}