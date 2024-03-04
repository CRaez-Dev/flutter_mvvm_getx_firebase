import 'package:flutter/material.dart';
import 'package:flutter_mvvm_getx_firebase/ui/screens/home/home_controller.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return Scaffold(
            appBar: AppBar(
              title: const Text('Cinemark Clone'),
            ),
            body: SafeArea(
              child: controller.listMovies.isEmpty
                  ? const Center(
                      child: CircularProgressIndicator(
                      strokeWidth: 2,
                    ))
                  : ListView.builder(
                      itemCount: controller.listMovies.length,
                      itemBuilder: (context, index) {
                        return Text(controller.listMovies[index].name);
                      },
                    ),
            ));
      },
    );
  }
}
