import 'package:flutter_mvvm_getx_firebase/ui/screens/form/form_binding.dart';
import 'package:flutter_mvvm_getx_firebase/ui/screens/form/form_screen.dart';
import 'package:flutter_mvvm_getx_firebase/ui/screens/home/home_binding.dart';
import 'package:flutter_mvvm_getx_firebase/ui/screens/home/home_screen.dart';
import 'package:get/get.dart';
import 'package:flutter_mvvm_getx_firebase/ui/screens/counter/counter_binding.dart';
import 'package:flutter_mvvm_getx_firebase/ui/screens/counter/counter_screen.dart';
import 'package:flutter_mvvm_getx_firebase/ui/screens/other/other_screen.dart';

class AppRoutes {
  static const String formRoute = '/';
  static const String homeRoute = '/home';
  static const String counterRoute = '/counter';
  static const String otherRoute = '/other';


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
  ];
}
