import 'package:eventrack_app/app/modules/edit_User_Profile/Provider/editprofile_providerImpl.dart';
import 'package:get/get.dart';

import '../controllers/edit_user_profile_controller.dart';

class EditUserProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditUserProfileController>(
      () => EditUserProfileController(),
    );
    Get.put(EditprofileProviderImpl());
  }
}
