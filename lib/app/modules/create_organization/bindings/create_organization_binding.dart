import 'package:get/get.dart';

import '../controllers/create_organization_controller.dart';

class CreateOrganizationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateOrganizationController>(
      () => CreateOrganizationController(),
    );
  }
}
