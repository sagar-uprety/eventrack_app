import 'package:eventrack_app/app/global_widgets/message.dart';
import 'package:eventrack_app/app/models/response.dart';
import 'package:eventrack_app/app/modules/token_verifcation/providers/token_verification_provider.dart';
import 'package:eventrack_app/app/modules/token_verifcation/providers/token_verification_provider_impl.dart';
import 'package:flutter/cupertino.dart';

import 'package:get/get.dart';

class TokenVerifcationController extends GetxController {
  // final String _email = Get.arguments;
  final String _email = 'ds.ed347@gmail.com';
  late TextEditingController token;
  final formKey = GlobalKey<FormState>();
  late TokenVerificationProvider _provider;

  @override
  void onInit() async {
    token = TextEditingController();
    _provider = Get.find<TokenVerificationProviderImpl>();
    await sendToken();
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

  Future sendToken() async {
    try {
      print('Sending Token...');
      ResponseModel? response = await _provider.sendToken({'email': _email});
      FlashMessage(response!.state, message: response.message);
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }
}
