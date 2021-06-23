import 'package:get/get.dart';

import '../controllers/login_controller.dart';
import '../provider/login_providerImpl.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<LoginProviderImpl>(LoginProviderImpl());
    Get.lazyPut<LoginController>(
      () => LoginController(),
    );
  }
}
