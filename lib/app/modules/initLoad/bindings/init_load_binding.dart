import 'package:get/get.dart';

import '../../../controllers/controllers/global_controller.dart';
import '../controllers/init_load_controller.dart';
import '../provider/home_pro_impl.dart';

class InitLoadBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<HomeProviderImpl>(HomeProviderImpl());
    Get.lazyPut<InitLoadController>(
      () => InitLoadController(),
    );
    Get.put<GlobalController>(GlobalController());
  }
}
