import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../provider/login_provider.dart';
import '../provider/login_providerImpl.dart';

class LoginController extends GetxController {
  final loginFormKey = GlobalKey<FormState>();
  late TextEditingController email;
  late TextEditingController password;
  final formKey = GlobalKey<FormState>();
  final bottomSheetFormKey = GlobalKey<FormState>();

  // late LoginProvider _loginProvider;
  late TextEditingController bottomSheetEmail;
  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    bottomSheetEmail = TextEditingController();
    // _loginProvider = Get.find<LoginProviderImpl>();

    super.onInit();
  }

  @override
  void onClose() {
    email.dispose();
    password.dispose();
    bottomSheetEmail.dispose();
    super.onClose();
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

    if (!GetUtils.isLengthLessThan(6, 25)) {
      return 'Your password should be at least 6 characters';
    }
    return null;
  }

  Future login() async {
    print("Hello World");

    /*   if (signupFormKey.currentState!.validate()) {
      //do API Call for signUp
      // registerUser(emailController.text, passwordController.text);

    } */
    // try {
    //   await _loginProvider.registerUser(data: {
    //     "name": 'Test Test',
    //     "email": "test12@gmail.com",
    //     "password": "nepal123"
    //   });
    // } catch (e) {
    //   print(e);
    // }
  }

  void getToken() {
    if (bottomSheetFormKey.currentState!.validate()) print('Sending Token...');
  }
}
