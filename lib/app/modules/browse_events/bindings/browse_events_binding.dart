import 'package:get/get.dart';

import '../controllers/browse_events_controller.dart';
import '../provider/events_pro_impl.dart';

class BrowseEventsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<EventsProviderImpl>(EventsProviderImpl());
    Get.put<BrowseEventsController>(BrowseEventsController());
  }
}
