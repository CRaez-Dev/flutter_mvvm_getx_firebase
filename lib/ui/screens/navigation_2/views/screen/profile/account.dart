import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Account extends StatelessWidget {
  static const String route = '/account';
  const Account({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cuenta',
          style: GoogleFonts.poppins(
              textStyle: const TextStyle(
                  fontWeight: FontWeight.w600, fontSize: 24, height: 32)),
        ),
      ),
      body: const Center(
        child: Text('Profile/Account'),
      ),
    );
  }
}
