import 'package:flutter_mvvm_getx_firebase/ui/screens/counter/counter_screen.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mvvm_getx_firebase/config/theme/app_theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      home: const Scaffold(
        body: CounterScreen(),
      ),
    );
  }
}
