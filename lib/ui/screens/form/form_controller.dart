import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  RxMap<String, TextEditingController> formController = {
    "email": TextEditingController(),
    "address": TextEditingController(),
    "passport": TextEditingController(),
  }.obs;

  RxMap<String, bool> validateForm = {
    "email": false,
    "address": false,
    "passport": false,
  }.obs;

  Rxn<Function()> nextFunction = Rxn<Function()>(null);
  RxInt validateAccomplishFields = 0.obs;

  @override
  void onInit() {
    super.onInit();

    ever(validateAccomplishFields, (value) {
      print('data: $value');
      validateAccomplish();
    });
  }

  String? validatorEmail(String? value, String key) {
    if (validateForm[key] == false) {
      if (value != null && GetUtils.isEmail(value)) {
        validateForm[key] == true;
        return null;
      } else {
        validateForm[key] == false;
        return 'Email invalid';
      }
    }

    return null;
  }

  String? validatorRequired(String? value, String key) {
    if (validateForm[key] == false) {
      if (value != null && value.isNotEmpty) {
        validateForm[key] == true;
        return null;
      } else {
        validateForm[key] == false;
        return 'Required field';
      }
    }
 
    return null;
  }

  void validateAccomplish() async {
    if (validateForm["email"] == true &&
        validateForm["address"] == true &&
        validateForm["passport"] == true &&
        await available()) {
      nextFunction.value = nextFunctionApply();
    }
  }

  Future<bool> available() async {
    await Future.delayed(const Duration(seconds: 1));
    return true;
  }

  Future<bool> Function() nextFunctionApply() {
    return () async {
      print('Test');
      return true;
    };
  }
}
