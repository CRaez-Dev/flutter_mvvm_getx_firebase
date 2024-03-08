import 'package:flutter/material.dart';
import 'package:flutter_mvvm_getx_firebase/ui/screens/navigation_2/navigation_2_controller.dart';
import 'package:flutter_mvvm_getx_firebase/ui/screens/navigation_2/widgets/custom_bottom_navigation_bar.dart';
import 'package:get/get.dart';

class Navigation2Screen extends StatelessWidget {
  const Navigation2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Navigation2Controller>(
      builder: (_) {
        return PopScope(
          canPop: false,
          onPopInvoked: (didPop) async {
            if (didPop) {
              final NavigatorState navigator = Navigator.of(context);
              navigator.pop();
              return;
            }
          },
          child: Scaffold(
            body: Obx(
              () => IndexedStack(
                index: _.currentIndex.value,
                children: _.navigationPages,
              ),
            ),
            extendBody: true,
            bottomNavigationBar: const CustomBottomNavigationBar(),
          ),
        );
      },
    );
  }
}
