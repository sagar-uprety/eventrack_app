import 'package:flutter/cupertino.dart';

import 'package:get/get.dart';

import '../../../global_widgets/message.dart';
import '../../../models/response.dart';
import '../../../routes/app_pages.dart';
import '../providers/token_verification_provider.dart';
import '../providers/token_verification_provider_impl.dart';

class TokenVerifcationController extends GetxController {
  late Map<String, dynamic> _arguments;
  late TextEditingController token = TextEditingController();
  final formKey = GlobalKey<FormState>();
  late TokenVerificationProvider _provider;

  @override
  void onInit() async {
    _arguments = Get.arguments;
    _provider = Get.find<TokenVerificationProviderImpl>();
    await sendToken();
    super.onInit();
  }

  String? tokenValidator(String? value) {
    if (value!.isEmpty) return 'This field cannot be empty.';
    if (!GetUtils.isLengthEqualTo(value, 6)) return 'Invalid token.';
    return null;
  }

  Future sendToken() async {
    ResponseModel? response =
        await _provider.sendToken({'email': _arguments['email']});
    FlashMessage(response!.state,
        message: response.message, displayOnSuccess: true);
  }

  Future verifyToken() async {
    if (_arguments['type'] == 'email')
      await verifyEmail();
    else
      await passwordReset();
  }

  Future verifyEmail() async {
    if (formKey.currentState!.validate()) {
      ResponseModel? response = await _provider
          .verifyToken({'email': _arguments['email'], 'token': token.text});
      FlashMessage(response!.state, message: response.message);
      if (response.state) Get.toNamed(Routes.INIT_LOAD);
    }
  }

  Future passwordReset() async {
    if (formKey.currentState!.validate()) {
      ResponseModel? response = await _provider
          .verifyToken({'email': _arguments['email'], 'token': token.text});
      FlashMessage(response!.state, message: response.message);
      if (response.state)
        Get.toNamed(Routes.PASSWORD_RESET, arguments: _arguments['email']);
    }
  }
}
