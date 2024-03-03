import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mvvm_getx_firebase/config/routes/app_routes.dart';
import 'package:flutter_mvvm_getx_firebase/config/theme/app_theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      getPages: AppRoutes.routes      
    );
  }
}
