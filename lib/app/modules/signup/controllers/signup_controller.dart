import 'package:eventrack_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../global_widgets/message.dart';
import '../../../models/response.dart';
import '../../../models/user/user.dart';
import '../provider/signup_provider.dart';
import '../provider/signup_provider_impl.dart';

class SignupController extends GetxController {
  //this key uniquely identifies a form
  final signupFormKey = GlobalKey<FormState>();
  late TextEditingController name;
  late TextEditingController email;
  late TextEditingController password;

  final RxBool obscurePassword = true.obs;

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
    try {
      if (signupFormKey.currentState!.validate()) {
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
          arguments: email.text.trim(),
        );
      }
    } catch (e) {
      print(e);
    }
  }
}
