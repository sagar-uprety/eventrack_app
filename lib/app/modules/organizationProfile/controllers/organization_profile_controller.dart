import 'package:get/get.dart';

class OrganizationProfileController extends GetxController {
  final RxBool showMore = false.obs;

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
