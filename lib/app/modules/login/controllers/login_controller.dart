import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../controllers/controllers/global_controller.dart';
import '../../../global_widgets/message.dart';
import '../../../models/response.dart';
import '../../../models/user/user.dart';
import '../../../routes/app_pages.dart';
import '../../../services/shared_prefs.dart';
import '../provider/login_provider.dart';
import '../provider/login_providerImpl.dart';

class LoginController extends GetxController {
  final loginFormKey = GlobalKey<FormState>();
  late TextEditingController email;
  late TextEditingController password;
  final bottomSheetFormKey = GlobalKey<FormState>();
  final RxBool obscurePassword = true.obs;

  late LoginProvider _loginProvider;
  late TextEditingController bottomSheetEmail;

  final Rx<bool> logging = false.obs;

  late GlobalController _global;
  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    bottomSheetEmail = TextEditingController();
    _loginProvider = Get.find<LoginProviderImpl>();
    _global = Get.find<GlobalController>();
    _global.removeCurrentData();
    super.onInit();
  }

  @override
  void onClose() {
    email.dispose();
    password.dispose();
    bottomSheetEmail.dispose();
    super.onClose();
  }

  void _changeLoggingState() => logging.value = !logging.value;

  void changePasswordObscurity() {
    obscurePassword.value = !obscurePassword.value;
    update();
  }

  String? emailValidator(String? value) {
    if (value!.isEmpty) return 'This field cannot be empty.';
    if (!GetUtils.isEmail(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? passwordValidator(String? value) {
    if (value!.isEmpty) return 'This field cannot be empty.';

    if (!GetUtils.isLengthLessThan(6, 25)) {
      return 'Your password should be at least 6 characters';
    }
    return null;
  }

  Future login() async {
    _changeLoggingState();
    try {
      if (loginFormKey.currentState!.validate()) {
        ResponseModel? response = await _loginProvider.loginUser(
          data: User(
            email: email.text.trim(),
            password: password.text,
          ).toJson(),
        );
        FlashMessage(response!.state, message: response.message);
        if (response.state) {
          await SharedPreference.saveAuthState(response.authToken!);
          Get.offAllNamed(Routes.INIT_LOAD);
        }
      }
    } catch (e) {
      print(e);
    }
    _changeLoggingState();
  }

  void getToken() {
    if (bottomSheetFormKey.currentState!.validate()) print('Sending Token...');
  }
}
