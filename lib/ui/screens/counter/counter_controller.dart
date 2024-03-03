import 'package:get/state_manager.dart';

class CounterController extends GetxController{

  RxInt count = 0.obs;

  void increment() => count.value++;

}