import 'package:get/get.dart';

import '../controllers/global_controller.dart';

class GlobalBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<GlobalController>(GlobalController());
  }
}
