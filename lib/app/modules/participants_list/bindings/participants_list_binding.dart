import 'package:get/get.dart';

import '../controllers/participants_list_controller.dart';

class ParticipantsListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ParticipantsListController>(
      () => ParticipantsListController(),
    );
  }
}
