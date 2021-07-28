import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../global_widgets/message.dart';
import '../../../models/response.dart';
import '../../../models/user/user.dart';
import '../../../routes/app_pages.dart';
import '../provider/signup_provider.dart';
import '../provider/signup_provider_impl.dart';

class SignupController extends GetxController {
  late TextEditingController name;
  late TextEditingController email;
  late TextEditingController password;

  final RxBool obscurePassword = true.obs;

  late SignUpProvider _signupProvider;

  final RxBool signing = false.obs;

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
    name.dispose();
    email.dispose();
    password.dispose();
    super.onClose();
  }

  void _changeSigningState() => signing.value = !signing.value;

  void changePasswordObscurity() {
    obscurePassword.value = !obscurePassword.value;
    update();
  }

  String? nameValidator(String? value) {
    if (value!.isEmpty) return 'This field cannot be empty.';
    return null;
  }

  String? emailValidator(String? value) {
    if (value!.trim().isEmpty) return 'This field cannot be empty.';
    if (!GetUtils.isEmail(value.trim())) {
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
    _changeSigningState();
    try {
      ResponseModel? response = await _signupProvider.registerUser(
        data: User(
          name: name.text.trim(),
          email: email.text.trim(),
          password: password.text,
        ).toJson(),
      );
      FlashMessage(response!.state, message: response.message);
      Get.toNamed(
        Routes.TOKEN_VERIFCATION,
        arguments: {'email': email.text.trim(), 'type': 'email'},
      );
    } catch (e) {
      print(e);
    }
    _changeSigningState();
  }
}
