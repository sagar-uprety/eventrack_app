import 'package:get/get.dart';

import '../controllers/password_reset_controller.dart';
import '../provider/password_reset_provider_impl.dart';

class PasswordResetBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PasswordResetProviderImpl());
    Get.lazyPut<PasswordResetController>(
      () => PasswordResetController(),
    );
  }
}
