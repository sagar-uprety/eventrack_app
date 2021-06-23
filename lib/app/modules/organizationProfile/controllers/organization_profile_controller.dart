import 'package:get/get.dart';

class OrganizationProfileController extends GetxController {
  final RxInt selectedTab = 0.obs;

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

  void changeTab(int? index) {
    selectedTab.value = index!;
  }
}
