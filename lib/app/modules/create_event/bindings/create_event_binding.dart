import 'package:get/get.dart';

import '../controllers/create_event_controller.dart';
import '../providers/create_event_providerImpl.dart';

class CreateEventBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<CreateEventProviderImpl>(CreateEventProviderImpl());
    Get.lazyPut<CreateEventController>(
      () => CreateEventController(),
    );
  }
}
