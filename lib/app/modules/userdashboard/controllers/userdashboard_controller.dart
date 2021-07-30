import 'package:eventrack_app/app/global_widgets/message.dart';
import 'package:eventrack_app/app/models/response.dart';
import 'package:eventrack_app/app/modules/initLoad/controllers/init_load_controller.dart';
import 'package:eventrack_app/app/modules/userdashboard/provider/user_dashboard_impl.dart';
import 'package:eventrack_app/app/modules/userdashboard/provider/user_provider.dart';
import 'package:eventrack_app/app/routes/app_pages.dart';
import 'package:get/get.dart';

import '../../../models/event/event.dart';
import '../../initLoad/controllers/init_load_controller.dart';

class UserdashboardController extends GetxController {
  late List<Event> events;
  late UserDashboardProvider dashboardProvider;
  late RxList<Event> _myFavourite;
  late RxList<Event> _myEvents;
  late InitLoadController global;

  List<Event> get favourites => _myFavourite;
  List<Event> get myEvents => _myEvents;

  String get fav => 'My Favourites';
  String get my => 'My Events';

  @override
  void onInit() async {
    global = Get.find<InitLoadController>();
    dashboardProvider = Get.find<UserProviderImpl>();
    _myFavourite = <Event>[].obs;
    _myEvents = <Event>[].obs;
    events = global.events;
    getMyFavourite();
    getMyEvents();
    super.onInit();
  }

  void seeAll(String type) {
    List<Event> arguments = [];
    if (type == fav)
      arguments = favourites;
    else if (type == my)
      arguments = myEvents;
    else
      arguments = global.events;
    Get.toNamed(Routes.EVENT_LIST, arguments: arguments);
  }

  updateMyFavourite(bool state, Event event) => state
      ? _myFavourite.removeAt(
          _myFavourite.indexWhere((element) => element.id == event.id))
      : _myFavourite.insert(0, event);

  updateMyEvents(bool state, Event event) => state
      ? _myEvents
          .removeAt(_myEvents.indexWhere((element) => element.id == event.id))
      : _myEvents.insert(0, event);

  getMyFavourite() async {
    ResponseModel? events = await dashboardProvider.getMyFavouriteEvents();
    FlashMessage(events!.state, message: events.message);
    if (events.state) _myFavourite.value = events.eventList!;
  }

  getMyEvents() async {
    ResponseModel? events = await dashboardProvider.getMyEvents();
    FlashMessage(events!.state, message: events.message);
    if (events.state) _myEvents.value = events.eventList!;
  }
}
