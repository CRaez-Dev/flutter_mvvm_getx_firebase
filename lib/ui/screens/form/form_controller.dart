import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  RxMap<String, TextEditingController> formController = {
    "email": TextEditingController(),
    "address": TextEditingController(),
    "passport": TextEditingController(),
  }.obs;

  Rxn<Function()> nextFunction = Rxn<Function()>(null);

  RxBool isNextActive = false.obs;

  String? validatorEmail(String? value) => value == null
      ? null
      : GetUtils.isEmail(value)
          ? null
          : 'Email invalid';

  String? validatorRequired(String? value) {
    if (value!.isNotEmpty) {
      return null;
    } else {
      return 'Required field';
    }
  }
}
