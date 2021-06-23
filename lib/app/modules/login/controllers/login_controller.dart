import 'package:eventrack_app/app/modules/login/provider/login_provider.dart';
import 'package:eventrack_app/app/modules/login/provider/login_providerImpl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final loginFormKey = GlobalKey<FormState>();
  late TextEditingController emailController;
  late TextEditingController passwordController;

  late LoginProvider _loginProvider;

  var email = '';
  var password = '';

  @override
  void onInit() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    _loginProvider = Get.find<LoginProviderImpl>();

    super.onInit();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  String? emailValidator(String? value) {
    if (!GetUtils.isEmail(value!)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? passwordValidator(String? value) {
    if (!GetUtils.isLengthLessThan(6, 25)) {
      return 'Your password should be at least 6 characters';
    }
    return null;
  }

  Future onPressedlogin() async {
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
}
