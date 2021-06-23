import 'package:get/get.dart';
import 'package:flutter/material.dart';

class PasswordResetController extends GetxController {
  //TODO: Implement PasswordResetController

  late TextEditingController newPassword;
  late TextEditingController retypedPassword;
  final RxBool obscureNewPassword = true.obs;
  final RxBool obscureRetyped = true.obs;

  final count = 0.obs;
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
  void onClose() {}
  void increment() => count.value++;
}
