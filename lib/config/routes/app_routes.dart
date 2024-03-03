import 'package:get/get.dart';
import 'package:flutter_mvvm_getx_firebase/ui/screens/counter/counter_binding.dart';
import 'package:flutter_mvvm_getx_firebase/ui/screens/counter/counter_screen.dart';
import 'package:flutter_mvvm_getx_firebase/ui/screens/other/other_screen.dart';

class AppRoutes {
  static const String homeRoute = '/';
  static const String otherRoute = '/other';


  static final routes = <GetPage>[
    GetPage(
        name: homeRoute,
        page: () => const CounterScreen(),
        binding: CounterBinding()),
    GetPage(
      name: otherRoute,
      page: () => const OtherScreen(),
    )
  ];
}
