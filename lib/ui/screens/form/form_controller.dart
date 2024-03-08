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

  @override
  void onInit() {
    super.onInit();

    ever(validateForm, (value) {
      validateAccomplish();
    });
  }

  String? validatorEmail(String? value, String key) {
    if (validateForm[key] == false) {
      if (value != null && GetUtils.isEmail(value)) {
        validateForm.update(key, (value) => true);
        return null;
      } else {
        validateForm.update(key, (value) => false);
        return 'Email invalid';
      }
    } else {
      if (value != null && GetUtils.isEmail(value)) {
        validateForm.update(key, (value) => true);
        return null;
      } else {
        validateForm.update(key, (value) => false);
        return 'Email invalid';
      }
    }
  }

  String? validatorRequired(String? value, String key) {
    if (validateForm[key] == false) {
      if (value != null && value.isNotEmpty) {
        validateForm.update(key, (value) => true);
        return null;
      } else {
        validateForm.update(key, (value) => false);
        return 'Required field';
      }
    } else {
      if (value != null && value.isNotEmpty) {
        validateForm.update(key, (value) => true);
        return null;
      } else {
        validateForm.update(key, (value) => false);
        return 'Required field';
      }
    }
  }

  void validateAccomplish() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (validateForm["email"] == true &&
          validateForm["address"] == true &&
          validateForm["passport"] == true) {
        nextFunction.value = nextFunctionApply();
      } else {
        if (nextFunction.value != null) {
          nextFunction.value = null;
        }
      }
    });
  }

  Future<bool> Function() nextFunctionApply() {
    return () async {      
      return true;
    };
  }
}
