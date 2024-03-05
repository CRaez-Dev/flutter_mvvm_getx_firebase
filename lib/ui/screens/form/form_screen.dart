import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_mvvm_getx_firebase/ui/screens/form/form_controller.dart';
import 'package:get/get.dart';

class FormScreen extends StatelessWidget {
  const FormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FormController>(
      builder: (_) => const Scaffold(
        body: SafeArea(
          child: _FormRegistration(),
        ),
      ),
    );
  }
}

class _FormRegistration extends StatelessWidget {
  const _FormRegistration();

  @override
  Widget build(BuildContext context) {
    final _ = Get.find<FormController>();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Registration Form",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Form(
                key: _.formKey,
                child: Column(
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        label: Text('Email'),
                      ),
                      validator: _.validatorEmail,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        label: Text('Address'),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        label: Text('Passport'),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
              width: double.infinity,
              color: Colors.amber,
              child: const FilledButton(onPressed: null, child: Text('Save')))
        ],
      ),
    );
  }
}


/**


                       
 
   
 */