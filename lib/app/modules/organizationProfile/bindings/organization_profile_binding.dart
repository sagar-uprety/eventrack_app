import 'package:get/get.dart';

import '../controllers/organization_profile_controller.dart';

class OrganizationProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrganizationProfileController>(
      () => OrganizationProfileController(),
    );
  }
}
