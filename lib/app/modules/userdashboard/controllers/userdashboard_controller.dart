import 'package:get/get.dart';

import '../../../controllers/controllers/global_controller.dart';
import '../../../temp_data.dart';

class UserdashboardController extends GetxController {
  get events => TempData.events;
  late GlobalController global;
  @override
  void onInit() async {
    global = Get.find<GlobalController>();
    print(
        'User: ${global.currentUser.toJson()}\n\n\n Organizaiton: ${global.organization.toJson()}');
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
