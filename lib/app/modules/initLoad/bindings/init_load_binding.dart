import 'package:get/get.dart';

import '../controllers/init_load_controller.dart';
import '../provider/home_pro_impl.dart';

class InitLoadBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<HomeProviderImpl>(HomeProviderImpl());
    Get.put(InitLoadController());
  }
}
