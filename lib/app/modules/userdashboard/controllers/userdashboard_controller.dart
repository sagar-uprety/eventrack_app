import 'package:get/get.dart';

import '../../../models/event/event.dart';
import '../../initLoad/controllers/init_load_controller.dart';

class UserdashboardController extends GetxController {
  late List<Event> events;
  late InitLoadController global;

  @override
  void onInit() async {
    global = Get.find<InitLoadController>();
    events = global.events;
    print(
        'User: ${global.currentUser.toJson()}\n\n\n Organizaiton: ${global.organization.toJson()}\n\n\n First Event: ${global.events.length}');
    super.onInit();
  }
}
