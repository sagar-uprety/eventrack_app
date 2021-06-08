import 'package:get/get.dart';

import '../controllers/user_profile_controller.dart';

class UserProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserProfileController>(
      () => UserProfileController(),
    );
  }
}
