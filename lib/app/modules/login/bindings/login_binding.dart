import 'package:get/get.dart';

import '../../../controllers/controllers/global_controller.dart';
import '../controllers/login_controller.dart';
import '../provider/login_providerImpl.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(GlobalController());
    Get.put<LoginProviderImpl>(LoginProviderImpl());
    Get.lazyPut<LoginController>(
      () => LoginController(),
    );
  }
}
