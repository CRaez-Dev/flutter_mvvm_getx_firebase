import 'package:flutter/widgets.dart';
import 'package:flutter_mvvm_getx_firebase/ui/screens/navigation_2/views/folder_view.dart';
import 'package:flutter_mvvm_getx_firebase/ui/screens/navigation_2/views/home_view.dart';
import 'package:flutter_mvvm_getx_firebase/ui/screens/navigation_2/views/pet_view.dart';
import 'package:flutter_mvvm_getx_firebase/ui/screens/navigation_2/views/profile_view.dart';
import 'package:get/get.dart';

class Navigation2Controller extends GetxController {
  // BottonNavigation states
  RxInt currentIndex = 0.obs;
  List<Widget> navigationPages = <Widget>[
    const HomeView(),
    const FolderView(),
    const ProfileView(),
    const PetView(),
  ];
  


// BottonNavigation methods
  void updateCurrentIndex(int value) => currentIndex.value = value;
}
