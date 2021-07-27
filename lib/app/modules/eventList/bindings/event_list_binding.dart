import 'package:eventrack_app/app/modules/initLoad/controllers/init_load_controller.dart';
import 'package:get/get.dart';

import '../../../controllers/controllers/global_controller.dart';
import '../controllers/event_list_controller.dart';
import '../provider/event_list_provider_impl.dart';

class EventListBinding extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut(() => InitLoadController());
    Get.put<EventListProviderImpl>(EventListProviderImpl());
    Get.lazyPut<EventListController>(() => EventListController());
  }
}
