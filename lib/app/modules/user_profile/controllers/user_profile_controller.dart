import 'package:get/get.dart';

import '../../../models/user.dart';

class UserProfileController extends GetxController {
  final user = User(
      "https://oesexportimport.com/wp-content/uploads/2020/07/user1.jpg",
      "Rose Watson",
      "Some@example.com",
      "shreya2057",
      "+977 9863556656",
      "Kathmandu",
      "Female");

  final count = 0.obs;
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
  void increment() => count.value++;
}
