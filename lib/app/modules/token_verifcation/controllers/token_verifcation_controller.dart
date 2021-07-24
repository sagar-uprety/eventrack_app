import 'package:flutter/cupertino.dart';

import 'package:get/get.dart';

import '../../../global_widgets/message.dart';
import '../../../models/response.dart';
import '../providers/token_verification_provider.dart';
import '../providers/token_verification_provider_impl.dart';

class TokenVerifcationController extends GetxController {
  late String _email;
  late TextEditingController token;
  final formKey = GlobalKey<FormState>();
  late TokenVerificationProvider _provider;

  @override
  void onInit() async {
    _email = Get.arguments;
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
      FlashMessage(response!.state,
          message: response.message, displayOnSuccess: true);
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }
}
