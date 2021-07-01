import 'package:eventrack_app/app/modules/token_verifcation/providers/token_verification_provider_impl.dart';
import 'package:get/get.dart';

import '../controllers/token_verifcation_controller.dart';

class TokenVerifcationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TokenVerifcationController>(
      () => TokenVerifcationController(),
    );
    Get.put<TokenVerificationProviderImpl>(TokenVerificationProviderImpl());
  }
}
