import 'package:get/get.dart';

import '../controllers/user_controller.dart';
import '../provider/user_pro_impl.dart';

class UserBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<UserProviderImpl>(UserProviderImpl());
    Get.put<UserController>(UserController());
  }
}
