import 'package:get/get.dart';

import '../../../models/user/user.dart';

class UserProfileController extends GetxController {
  final user = User(
      profileImage:
          "https://oesexportimport.com/wp-content/uploads/2020/07/user1.jpg",
      name: "Rose Watson",
      email: "rosewatson@example.com",
      phone: "+977 9863556656",
      address: "New York",
      gender: "Female");

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
}
