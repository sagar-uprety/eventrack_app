import 'package:get/get.dart';

import '../controllers/password_reset_controller.dart';

class PasswordResetBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PasswordResetController>(
      () => PasswordResetController(),
    );
  }
}
