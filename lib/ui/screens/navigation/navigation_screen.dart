import 'package:flutter/material.dart';
import 'package:flutter_mvvm_getx_firebase/ui/screens/navigation/models/destination_items.dart';
import 'package:flutter_mvvm_getx_firebase/ui/screens/navigation/navigation_controller.dart';
import 'package:get/get.dart';

class NavigationScreen extends StatelessWidget {
  const NavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavigationController>(
      builder: (_) {
        return NavigatorPopHandler(
          onPop: _.handleOnPop,
          child: Scaffold(
            extendBody: true,
            body: Stack(
              fit: StackFit.expand,
              children: _.allDestinations.map(
                (DestinationItems destination) {
                  final int index = destination.index;
                  final Widget view = _.destinationViews[index];

                  if (index == _.selectedIndex.value) {
                    return Offstage(
                      offstage: false,
                      child: view,
                    );
                  } else {
                    return Offstage(
                      child: view,
                    );
                  }
                },
              ).toList(),
            ),
            bottomNavigationBar: const BottonNavigationBarCustom2(),
          ),
        );
      },
    );
  }
}

class BottonNavigationBarCustom extends StatelessWidget {
  const BottonNavigationBarCustom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final _ = Get.find<NavigationController>();

    return Container(
      height: 70,
      padding: const EdgeInsets.all(12),
      // margin: const EdgeInsets.symmetric(horizontal: 24),
      decoration: const BoxDecoration(
        color: Color(0xFF17203A),
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),

      child: Obx(
        () {
          return NavigationBar(
            selectedIndex: _.selectedIndex.value,
            onDestinationSelected: _.selectedIndex,
            labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
            indicatorColor: Colors.transparent,
            backgroundColor: Colors.transparent,
            // backgroundColor: const Color(0xFF17203A),
            destinations: _.allDestinations
                .map<NavigationDestination>((DestinationItems item) {
              return NavigationDestination(
                  icon: Icon(item.icon, color: item.color),
                  selectedIcon: Icon(item.icon, color: item.activeColor),
                  label: item.title);
            }).toList(),
          );
        },
      ),
    );
  }
}

class BottonNavigationBarCustom2 extends StatelessWidget {
  const BottonNavigationBarCustom2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final _ = Get.find<NavigationController>();

    return Container(
      // height: 70,
      padding: const EdgeInsets.all(12),
      // margin: const EdgeInsets.symmetric(horizontal: 24),
      decoration: const BoxDecoration(
        color: Color(0xFF17203A),
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),

      child: Obx(
        () {
          return BottomNavigationBar(
            currentIndex: _.selectedIndex.value,
            onTap: _.selectedIndex,
            type: BottomNavigationBarType.fixed,
            // labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
            backgroundColor: Colors.transparent,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            // backgroundColor: const Color(0xFF17203A),
            items: _.allDestinations
                .map<BottomNavigationBarItem>((DestinationItems item) {
              return BottomNavigationBarItem(
                icon: Icon(                  
                  item.icon,
                  color: item.color,
                ),
                activeIcon: Icon(
                  item.icon,
                  color: item.activeColor,
                ),
                backgroundColor: Colors.transparent,
                label: item.title,
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
