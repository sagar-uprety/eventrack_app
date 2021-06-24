import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../provider/signup_provider.dart';
import '../provider/signup_provider_impl.dart';

class SignupController extends GetxController {
  //this key uniquely identifies a form
  final signupFormKey = GlobalKey<FormState>();
  late TextEditingController name;
  late TextEditingController email;
  late TextEditingController password;

  late SignUpProvider _signupProvider;

  //initialize
  @override
  void onInit() {
    name = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    _signupProvider = Get.find<SignUpProviderImpl>();

    super.onInit();
  }

  @override
  void onClose() {
    email.dispose();
    password.dispose();
    super.onClose();
  }

  String? nameValidator(String? value) {
    if (value!.isEmpty) return 'This field cannot be empty.';
    return null;
  }

  String? emailValidator(String? value) {
    if (value!.isEmpty) return 'This field cannot be empty.';
    if (!GetUtils.isEmail(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? passwordValidator(String? value) {
    if (value!.isEmpty) return 'This field cannot be empty.';
    if (GetUtils.isLengthLessThan(value, 8))
      return 'The password must be at least 8 characters.';
    return null;
  }

  Future signup() async {
    print("Hello World");

    /*   if (signupFormKey.currentState!.validate()) {
      //do API Call for signUp
      // registerUser(email.text, password.text);

    } */
    try {
      await _signupProvider.registerUser(data: {
        "name": 'Test Test',
        "email": "test12@gmail.com",
        "password": "nepal123"
      });
    } catch (e) {
      print(e);
    }
  }
}
