import 'package:get/get.dart';

import '../controllers/browse_events_controller.dart';

class BrowseEventsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BrowseEventsController>(
      () => BrowseEventsController(),
    );
  }
}
