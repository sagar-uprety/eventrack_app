import 'package:eventrack_app/app/modules/initLoad/controllers/init_load_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../global_widgets/message.dart';
import '../../../models/event/event.dart';
import '../../../models/response.dart';
import '../../../models/user/user.dart';
import '../provider/event_detail_provider.dart';
import '../provider/event_detail_provider_impl.dart';

class EventDetailController extends GetxController {
  final RxBool registered = false.obs;
  final RxBool registering = false.obs;
  final RxBool showMore = false.obs;
  late GoogleMapController? mapController;
  late InitLoadController globalController;
  late EventDetailProvider _eventDetailProvider;

  Event get event => Get.arguments;

  // get users => TempData.users;
  late TextEditingController searchText;
  late RxList<User> partcipantList;

  @override
  void onInit() {
    searchText = TextEditingController();
    globalController = Get.find<InitLoadController>();
    _eventDetailProvider = Get.find<EventDetailProviderImpl>();
    partcipantList = <User>[].obs;
    getParticipantsData();
    // registerValue();
    super.onInit();
  }

  register() {
    registered.value =
        globalController.currentUser.registeredEvents!.contains(event.id);
    print(registered);
    update();
  }

  registerforevent() async {
    try {
      registering.value = true;
      ResponseModel? register =
          await _eventDetailProvider.registerToEvent(event.id!);
      //this result is already parsed and is converted to List<Events>
      if (register!.state) {
        print("User registered");
        FlashMessage(register.state,
            message: register.message, displayOnSuccess: true);
        registered.value = !registered.value;
      } else {
        print("Data Not Found");
      }
    } catch (e) {
      print(e);
    }
    registering.value = false;
    update();
  }

  getParticipantsData() async {
    try {
      ResponseModel? participants =
          await _eventDetailProvider.getParticipants(event.id!);
      //this result is already parsed and is converted to List<Events>
      if (participants!.state) {
        print("Users data found");
        partcipantList.value = participants.userList!;
      } else {
        print("Users Data Not Found");
      }
    } catch (e) {
      print(e);
    }
  }

  addtoFavorites(String id) async {
    try {
      ResponseModel added =
          await _eventDetailProvider.addtoFavourites(event.id!);
      print(added.toJson());
      if (added.state) {
        print("Added to Favourites");
        FlashMessage(added.state,
            message: added.message, displayOnSuccess: true);
      } else {
        print("Users Data Not Found");
      }
    } catch (e) {
      print(e);
    }
  }

  void search() {
    print('Search for ${searchText.text}');
  }

  void toggleDescriptionDisplay() => showMore.value = !showMore.value;

  void createMap(GoogleMapController newMapController) {
    mapController = newMapController;
    update();
  }
}
