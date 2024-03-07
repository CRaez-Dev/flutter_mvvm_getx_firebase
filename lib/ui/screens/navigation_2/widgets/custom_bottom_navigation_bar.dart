import 'package:flutter/material.dart';
import 'package:flutter_mvvm_getx_firebase/ui/screens/navigation_2/navigation_2_controller.dart';
import 'package:get/get.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    final _ = Get.find<Navigation2Controller>();

    return SafeArea(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: Obx(
          () => ClipRRect(
            borderRadius: BorderRadius.circular(25),
            
            child: BottomNavigationBar(
              elevation: 0,
              backgroundColor: const Color(0xFF17203A),
              currentIndex: _.currentIndex.value,
              onTap: _.updateCurrentIndex,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              selectedItemColor: const Color(0xFF70B38F),
              unselectedItemColor: const Color(0xFFACACE5),
              type: BottomNavigationBarType.fixed,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined),
                  label: 'home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.folder_outlined),
                  label: 'folder',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline),
                  label: 'person_outline',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.pets),
                  label: 'pets',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
