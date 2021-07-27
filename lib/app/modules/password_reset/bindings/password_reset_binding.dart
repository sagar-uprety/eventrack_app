import 'package:eventrack_app/app/modules/password_reset/provider/password_reset_provider_impl.dart';
import 'package:get/get.dart';

import '../controllers/password_reset_controller.dart';

class PasswordResetBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PasswordResetProviderImpl());
    Get.lazyPut<PasswordResetController>(
      () => PasswordResetController(),
    );
  }
}
