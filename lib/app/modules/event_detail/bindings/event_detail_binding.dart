import 'package:eventrack_app/app/controllers/controllers/global_controller.dart';
import 'package:get/get.dart';

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
