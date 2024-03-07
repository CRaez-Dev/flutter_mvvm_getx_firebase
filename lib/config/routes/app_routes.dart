import 'package:flutter_mvvm_getx_firebase/ui/screens/form/form_binding.dart';
import 'package:flutter_mvvm_getx_firebase/ui/screens/form/form_screen.dart';
import 'package:flutter_mvvm_getx_firebase/ui/screens/home/home_binding.dart';
import 'package:flutter_mvvm_getx_firebase/ui/screens/home/home_screen.dart';
import 'package:flutter_mvvm_getx_firebase/ui/screens/navigation/navigation_binding.dart';
import 'package:flutter_mvvm_getx_firebase/ui/screens/navigation/navigation_screen.dart';
import 'package:flutter_mvvm_getx_firebase/ui/screens/navigation_2/navigation_2_bindings.dart';
import 'package:flutter_mvvm_getx_firebase/ui/screens/navigation_2/navigation_2_screen.dart';
import 'package:get/get.dart';
import 'package:flutter_mvvm_getx_firebase/ui/screens/counter/counter_binding.dart';
import 'package:flutter_mvvm_getx_firebase/ui/screens/counter/counter_screen.dart';
import 'package:flutter_mvvm_getx_firebase/ui/screens/other/other_screen.dart';

class AppRoutes {
  static const String homeRoute = '/';
  static const String formRoute = '/form';
  static const String navigationRoute = '/navigation';
  static const String navigation2Route = '/navigation2';
  static const String counterRoute = '/counter';
  static const String otherRoute = '/other';

  static const String initialRoute = navigation2Route;

  static final routes = <GetPage>[
    GetPage(
        name: homeRoute,
        page: () => const HomeScreen(),
        binding: HomeBinding()),
    GetPage(
        name: counterRoute,
        page: () => const CounterScreen(),
        binding: CounterBinding()),
    GetPage(
      name: otherRoute,
      page: () => const OtherScreen(),
    ),
    GetPage(
        name: formRoute,
        page: () => const FormScreen(),
        binding: FormBinding()),
    GetPage(
        name: navigationRoute,
        page: () => const NavigationScreen(),
        binding: NavigationBinding()),
    GetPage(
        name: navigation2Route,
        page: () => const Navigation2Screen(),
        binding: Navigation2Binding())
  ];
}
