import 'package:get/get.dart';

import '../controllers/event_detail_controller.dart';
import '../provider/event_detail_provider_impl.dart';

class EventDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<EventDetailProviderImpl>(EventDetailProviderImpl());

    Get.lazyPut<EventDetailController>(
      () => EventDetailController(),
    );
  }
}
