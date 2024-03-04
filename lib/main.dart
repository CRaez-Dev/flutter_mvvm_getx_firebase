import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mvvm_getx_firebase/config/routes/app_routes.dart';
import 'package:flutter_mvvm_getx_firebase/config/theme/app_theme.dart';

Future<void> main() async {

  // Loading up .env variables
  await dotenv.load(fileName: ".env");
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
