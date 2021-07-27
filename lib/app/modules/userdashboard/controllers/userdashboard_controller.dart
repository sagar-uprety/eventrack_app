import 'package:eventrack_app/app/modules/initLoad/controllers/init_load_controller.dart';
import 'package:get/get.dart';

import '../../../models/event/event.dart';

class UserdashboardController extends GetxController {
  late List<Event> events;
  late InitLoadController global;

  @override
  void onInit() async {
    global = Get.find<InitLoadController>();
    print(
        'User: ${global.currentUser.toJson()}\n\n\n Organizaiton: ${global.organization.toJson()}\n\n\n First Event: ${global.events[0].toJson()}');
    super.onInit();
    events = global.events;
  }
}
