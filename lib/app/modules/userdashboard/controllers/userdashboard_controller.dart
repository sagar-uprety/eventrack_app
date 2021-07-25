import 'package:eventrack_app/app/controllers/controllers/global_controller.dart';
import 'package:get/get.dart';

import '../../../temp_data.dart';

class UserdashboardController extends GetxController {
  get events => TempData.events;

  @override
  void onInit() async {
    final user = Get.find<GlobalController>();
    print(user.currentUser.toJson());
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
