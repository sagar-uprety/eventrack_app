import 'package:eventrack_app/app/modules/create_event/providers/create_event_providerImpl.dart';
import 'package:get/get.dart';

import '../controllers/create_event_controller.dart';

class CreateEventBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<CreateEventProviderImpl>(CreateEventProviderImpl());
    Get.lazyPut<CreateEventController>(
      () => CreateEventController(),
    );
  }
}
