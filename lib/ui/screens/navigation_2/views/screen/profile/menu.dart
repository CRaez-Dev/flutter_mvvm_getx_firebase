import 'package:flutter/material.dart';
import 'package:flutter_mvvm_getx_firebase/ui/screens/navigation_2/views/models/profile_nav_item.dart';
import 'package:flutter_mvvm_getx_firebase/ui/screens/navigation_2/views/screen/profile/account.dart';
import 'package:flutter_mvvm_getx_firebase/ui/screens/navigation_2/views/screen/profile/medical_information.dart';
import 'package:flutter_mvvm_getx_firebase/ui/screens/navigation_2/views/utils/utils.dart';
import 'package:flutter_mvvm_getx_firebase/ui/screens/navigation_2/views/widgets/profile_nav_item.dart';

class Menu extends StatelessWidget {
  static const String route = '/';

  final optionsList = <ProfileNavModel>[
    ProfileNavModel(name: "Cuenta", bottomSpace: 4, route: Account.route),
    ProfileNavModel(
        name: "Ficha clinica",
        bottomSpace: 36,
        route: MedicalInformation.route),
    ProfileNavModel(name: "Idioma", bottomSpace: 4),
    ProfileNavModel(name: "Setting", bottomSpace: 4),
    ProfileNavModel(name: "Terminos y Condiciones", bottomSpace: 4),
    ProfileNavModel(name: "Sobre nosotros", bottomSpace: 36),
    ProfileNavModel(name: "Cerrar sesion", bottomSpace: 12),
  ];

  Menu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.network(
                  'https://picsum.photos/id/237/200/200',
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            const Text(
              'Doki Raez',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 24,
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: optionsList.map((option) {
                    return Column(
                      children: [
                        ProfileNavItem(
                          name: option.name,
                          onHandlePressed: () async {
                            await navigate(
                              context,
                              option.route,
                              isRootNavigator: false,
                            );
                          },
                        ),
                        SizedBox(
                          height: option.bottomSpace,
                        )
                      ],
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
