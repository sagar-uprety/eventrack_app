import 'package:eventrack_app/app/controllers/controllers/global_controller.dart';
import 'package:eventrack_app/app/modules/initLoad/controllers/init_load_controller.dart';
import 'package:eventrack_app/app/modules/userdashboard/provider/user_dashboard_impl.dart';
import 'package:get/get.dart';

import '../controllers/userdashboard_controller.dart';

class UserdashboardBinding extends Bindings {
  @override
  void dependencies() {
     Get.put(GlobalController());
     Get.put<UserProviderImpl>(UserProviderImpl());
    Get.lazyPut<UserdashboardController>(
      () => UserdashboardController(),
    );
  }
}
