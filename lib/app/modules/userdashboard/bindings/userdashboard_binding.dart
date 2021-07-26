import 'package:get/get.dart';

import '../../../controllers/controllers/global_controller.dart';
import '../controllers/userdashboard_controller.dart';

class UserdashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(GlobalController());
    Get.lazyPut<UserdashboardController>(
      () => UserdashboardController(),
    );
  }
}
