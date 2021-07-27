import 'package:get/get.dart';

import '../controllers/userdashboard_controller.dart';

class UserdashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserdashboardController>(
      () => UserdashboardController(),
    );
  }
}
