import 'package:get/get.dart';

import '../controllers/userdashboard_controller.dart';
import '../provider/user_dashboard_impl.dart';

class UserdashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<UserProviderImpl>(UserProviderImpl());
    Get.lazyPut<UserdashboardController>(
      () => UserdashboardController(),
    );
  }
}
