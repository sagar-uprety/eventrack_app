import 'package:get/get.dart';

import '../controllers/user_list_controller.dart';

class UserListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserListController>(
      () => UserListController(),
    );
  }
}
