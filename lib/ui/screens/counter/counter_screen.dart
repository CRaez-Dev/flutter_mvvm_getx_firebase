import 'package:flutter/material.dart';
import 'package:flutter_mvvm_getx_firebase/ui/screens/counter/counter_controller.dart';
import 'package:flutter_mvvm_getx_firebase/ui/screens/other/other_screen.dart';
import 'package:get/get.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CounterController controller = Get.put(CounterController());

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Obx(() => Text('Count: ${controller.count}'))]),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FilledButton(
            onPressed: controller.increment,
            child: const Icon(Icons.add_outlined)
          ),
          const SizedBox(height: 20,),
          FilledButton(
            onPressed: () => Get.to(() => const OtherScreen()),
            child: const Icon(Icons.arrow_right_alt_outlined)
          ),
        ],
      ),
    );
  }
}
