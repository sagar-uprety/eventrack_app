import 'package:get/get.dart';

import '../../../models/organization/organization.dart';

class OrganizationProfileController extends GetxController {
  final RxBool showMore = false.obs;
  final Organization orgData = Get.arguments;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void toggleDescriptionDisplay() => showMore.value = !showMore.value;
}
