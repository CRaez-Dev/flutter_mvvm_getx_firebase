import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  RxList<Map<String, TextEditingController>> formController =
      <Map<String, TextEditingController>>[
    {
      "email": TextEditingController(),
    },
    {
      "address": TextEditingController(),
    },
    {
      "passport": TextEditingController(),
    },
  ].obs;

  @override
  void onInit() {
    super.onInit();
  }

  String? validatorEmail(String? value) => value == null
      ? null
      : GetUtils.isEmail(value)
          ? null
          : 'Email invalid';
}
