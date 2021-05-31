import 'package:eventrack_app/app/modules/signup/provider/signup_provider_impl.dart';
import 'package:get/get.dart';

import '../controllers/signup_controller.dart';

class SignupBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<SignUpProviderImpl>(SignUpProviderImpl());
    Get.put<SignupController>(SignupController());
  }
}
