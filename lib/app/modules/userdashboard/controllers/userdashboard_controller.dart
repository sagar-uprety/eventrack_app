import 'package:get/get.dart';

import '../../../controllers/controllers/global_controller.dart';
import '../../../models/event/event.dart';
import '../../../temp_data.dart';

class UserdashboardController extends GetxController {
  late List<Event> events;
  late GlobalController global;
  @override
  void onInit() async {
    global = Get.find<GlobalController>();
    print(
        'User: ${global.currentUser.toJson()}\n\n\n Organizaiton: ${global.organization.toJson()}\n\n\n First Event: ${global.events[0].toJson()}');
    super.onInit();
    events = global.events;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
