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
    getMyFavourite();
    getMyEvents();
    events = global.events;
    print(
        'User: ${global.currentUser.toJson()}\n\n\n Organizaiton: ${global.organization.toJson()}\n\n\n First Event: ${global.events.length}');
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

  getMyFavourite() async {
    try {
      ResponseModel? events = await dashboardProvider.getMyFavouriteEvents();
      if (events!.state) {
        print('MyFavourite Events found');
        _myFavourite.value = events.eventList!;
      } else {
        print('My Favourite Events not found');
      }
    } catch (e) {
      print(e);
    }
  }

  getMyEvents() async {
    try {
      ResponseModel? events = await dashboardProvider.getMyEvents();
      if (events!.state) {
        print('MyFavourite Events found');
        _myEvents.value = events.eventList!;
      } else {
        print('My Events not found');
      }
    } catch (e) {
      print(e);
    }
  }
}
