import 'package:flutter/material.dart';

import 'package:get/get.dart';

class PasswordResetController extends GetxController {
  late TextEditingController newPassword;
  late TextEditingController retypedPassword;
  final RxBool obscureNewPassword = true.obs;
  final RxBool obscureRetyped = true.obs;
  final formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    newPassword = TextEditingController();
    retypedPassword = TextEditingController();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    newPassword.dispose();
    retypedPassword.dispose();
  }

  String? passwordValidator(String? value) {
    if (value!.isEmpty) return 'This field cannot be empty.';
    if (GetUtils.isLengthLessThan(value, 8))
      return 'The password must be at least 8 characters.';
    return null;
  }

  String? retypedPasswordValidator(String? value) {
    if (value!.isEmpty) return 'This field cannot be empty.';
    if (newPassword.text != value) return 'The passwords do not match.';
    return null;
  }

  void changePasswordObscurity() {
    obscureNewPassword.value = !obscureNewPassword.value;
  }

  void changeRetypedObscurity() {
    obscureRetyped.value = !obscureRetyped.value;
  }

  void submit() {
    if (formKey.currentState!.validate()) print('Password Changed');
  }
}
