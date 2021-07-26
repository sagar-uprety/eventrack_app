import 'package:get/get.dart';

import '../../../controllers/controllers/global_controller.dart';
import '../controllers/event_detail_controller.dart';

class EventDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EventDetailController>(
      () => EventDetailController(),
    );
    Get.put(GlobalController());
  }
}
