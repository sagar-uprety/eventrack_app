import 'package:eventrack_app/app/modules/login/provider/login_providerImpl.dart';
import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<LoginProviderImpl>(LoginProviderImpl());
    Get.lazyPut<LoginController>(
      () => LoginController(),
    );
  }
}
