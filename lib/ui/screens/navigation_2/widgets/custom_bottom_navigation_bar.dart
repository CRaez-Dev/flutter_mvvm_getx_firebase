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
        decoration: const BoxDecoration(          
        color:  Color(0xFF17203A),
          borderRadius: BorderRadius.all(
             Radius.circular(25),            
          ),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 16),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Obx(
          () => BottomNavigationBar(
            elevation: 0.0,
            backgroundColor: Colors.transparent,
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
    );
  }
}
