import 'package:get/get.dart';

import '../controllers/create_organization_controller.dart';
import '../providers/create_organization_providerImpl.dart';

class CreateOrganizationBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<CreateOrganizationProviderImpl>(CreateOrganizationProviderImpl());
    Get.lazyPut<CreateOrganizationController>(
      () => CreateOrganizationController(),
    );
  }
}
