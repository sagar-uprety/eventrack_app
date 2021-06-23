import 'package:get/get.dart';

import '../controllers/enter_email_controller.dart';

class EnterEmailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EnterEmailController>(
      () => EnterEmailController(),
    );
  }
}
