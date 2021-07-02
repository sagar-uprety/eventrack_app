import 'package:get/get.dart';

import '../controllers/token_verifcation_controller.dart';

class TokenVerifcationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TokenVerifcationController>(
      () => TokenVerifcationController(),
    );
  }
}
