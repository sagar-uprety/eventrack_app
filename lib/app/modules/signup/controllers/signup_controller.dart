import 'package:eventrack_app/app/modules/signup/provider/signup_provider.dart';
import 'package:eventrack_app/app/modules/signup/provider/signup_provider_impl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  //this key uniquely identifies a form
  final signupFormKey = GlobalKey<FormState>();
  late TextEditingController emailController;
  late TextEditingController passwordController;

  late SignUpProvider _signupProvider;

  var email = '';
  var password = '';

  //initialize
  @override
  void onInit() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    _signupProvider = Get.find<SignUpProviderImpl>();

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

  Future onPressedsignUp() async {
    print("Hello World");

    /*   if (signupFormKey.currentState!.validate()) {
      //do API Call for signUp
      // registerUser(emailController.text, passwordController.text);

    } */
    try {
      await _signupProvider.registerUser(
          data: {"email": "test1@gmail.com", "password": "nepal123"});
    } catch (e) {
      print(e);
    }
  }
}
