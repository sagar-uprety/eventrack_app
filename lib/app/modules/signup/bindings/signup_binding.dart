import 'package:get/get.dart';

import '../controllers/signup_controller.dart';
import '../provider/signup_provider_impl.dart';

class SignupBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<SignUpProviderImpl>(SignUpProviderImpl());
    Get.put<SignupController>(SignupController());
  }
}
