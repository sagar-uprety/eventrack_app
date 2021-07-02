import 'package:flutter/cupertino.dart';

import 'package:get/get.dart';

class TokenVerifcationController extends GetxController {
  late TextEditingController token;
  final formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    token = TextEditingController();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    token.dispose();
  }

  String? tokenValidator(String? value) {
    if (value!.isEmpty) return 'This field cannot be empty.';
    if (!GetUtils.isLengthEqualTo(value, 6)) return 'Invalid token.';
    return null;
  }

  void submit() {
    if (formKey.currentState!.validate())
      print('Token Submitted for verification');
  }
}
