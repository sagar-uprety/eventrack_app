import 'package:get/get.dart';

import '../controllers/token_verifcation_controller.dart';
import '../providers/token_verification_provider_impl.dart';

class TokenVerifcationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TokenVerifcationController>(
      () => TokenVerifcationController(),
    );
    Get.put<TokenVerificationProviderImpl>(TokenVerificationProviderImpl());
  }
}
