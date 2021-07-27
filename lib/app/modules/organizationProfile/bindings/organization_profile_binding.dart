import 'package:get/get.dart';

import '../controllers/organization_profile_controller.dart';
import '../provider/org_profile_provider_impl.dart';

class OrganizationProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<OrgProfileProviderImpl>(OrgProfileProviderImpl());

    Get.lazyPut<OrganizationProfileController>(
      () => OrganizationProfileController(),
    );
  }
}
