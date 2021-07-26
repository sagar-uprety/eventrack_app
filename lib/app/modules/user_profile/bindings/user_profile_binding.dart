import 'package:eventrack_app/app/controllers/controllers/global_controller.dart';
import 'package:get/get.dart';

import '../controllers/user_profile_controller.dart';
import '../provider/userProfile_provider_impl.dart';

class UserProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<UserProfileProviderImpl>(UserProfileProviderImpl());
    Get.lazyPut<UserProfileController>(
      () => UserProfileController(),
    );
    Get.put(GlobalController());
  }
}
