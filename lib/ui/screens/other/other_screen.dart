import 'package:flutter/material.dart';
import 'package:flutter_mvvm_getx_firebase/ui/screens/counter/counter_controller.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';

class OtherScreen extends StatelessWidget {
  const OtherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CounterController>();

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text('${controller.count}')          
        ),
      ),
      floatingActionButton: FilledButton(
            onPressed: () => Get.back(),
            child: const Icon(Icons.arrow_back_outlined)
          ),
    );
  }
}
