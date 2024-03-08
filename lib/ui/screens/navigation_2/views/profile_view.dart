import 'package:flutter/material.dart';
import 'package:flutter_mvvm_getx_firebase/ui/screens/navigation_2/views/home/models/profile_nav_item.dart';

import 'home/widgets/profile_nav_item.dart';

class ProfileView extends StatelessWidget {
  final optionsList = <ProfileNavModel>[
    ProfileNavModel(name: "Cuenta", bottomSpace: 4, onHandleNav: () {}),
    ProfileNavModel(name: "Ficha clinica", bottomSpace: 36, onHandleNav: () {}),
    ProfileNavModel(name: "Idioma", bottomSpace: 4, onHandleNav: () {}),
    ProfileNavModel(name: "Setting", bottomSpace: 4, onHandleNav: () {}),
    ProfileNavModel(
        name: "Terminos y Condiciones", bottomSpace: 4, onHandleNav: () {}),
    ProfileNavModel(name: "Sobre nosotros", bottomSpace: 36, onHandleNav: () {}),
    ProfileNavModel(name: "Cerrar sesion", bottomSpace: 12, onHandleNav: () {}),
  ];

  ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(      
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
                          ProfileNavitem(
                            name: option.name,
                            onPressed: option.onHandleNav,
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
      ),
    );
  }
}
