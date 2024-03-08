import 'package:flutter/material.dart';
import 'package:flutter_mvvm_getx_firebase/ui/screens/navigation_2/views/screen/profile/account.dart';
import 'package:flutter_mvvm_getx_firebase/ui/screens/navigation_2/views/screen/profile/medical_information.dart';
import 'package:flutter_mvvm_getx_firebase/ui/screens/navigation_2/views/screen/profile/menu.dart';

class ProfileView extends StatelessWidget {
  final Key menuKey = const Key('/');

  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Navigator(
        key: menuKey,
        initialRoute: Menu.route,
        onGenerateRoute: (RouteSettings settings) {
          WidgetBuilder builder;

          switch (settings.name) {
            case Menu.route:
              builder = (context) => Menu();
              break;
            case Account.route:
              builder = (context) => const Account();
              break;
            case MedicalInformation.route:
              builder = (context) => const MedicalInformation();
              break;
            default:
              builder = (context) => Menu();
          }

          return MaterialPageRoute(builder: builder, settings: settings);
        },
      ),
    );
  }
}
